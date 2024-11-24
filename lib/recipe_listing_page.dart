import 'package:ChefMate/cooking_page.dart';
import 'package:flutter/material.dart';
import 'mongo_helper.dart';  // MongoDB helper class
import 'recipe.dart';  // Recipe and Ingredient models

class RecipeListingPage extends StatefulWidget {
  const RecipeListingPage({super.key});

  @override
  _RecipeListingPageState createState() => _RecipeListingPageState();
}

class _RecipeListingPageState extends State<RecipeListingPage> {
  late Future<List<Recipe>> _recipesFuture;

  @override
  void initState() {
    super.initState();
    _recipesFuture = MongoHelper.fetchRecipes();  // Fetch recipes from MongoDB
  }

  @override
  void dispose() {
    MongoHelper.close();  // Close the MongoDB connection when the page is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Recipes', style: TextStyle(color: Color(0xFF229799))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Recipe>>(
        future: _recipesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No recipes found.'));
          } else {
            final recipes = snapshot.data!;

            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/list_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: const Icon(Icons.fastfood, color: Color(0xFF48CFCB)),
                        title: Text(
                          recipes[index].name,
                          style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
                        ),
                        onTap: () {
                          _showPersonDialog(context, recipes[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _showPersonDialog(BuildContext context, Recipe recipe) {
    final TextEditingController personController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 15, 2, 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Enter number of persons', style: TextStyle(color: Color(0xFF229799))),
          content: TextField(
            controller: personController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Number of persons',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String input = personController.text.trim();
                if (input.isEmpty || int.tryParse(input) == null || int.parse(input) <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid number of persons')),
                  );
                } else {
                  int personCount = int.parse(input);
                  Navigator.pop(context); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CookingPage(recipe: recipe, personCount: personCount),
                    ),
                  );
                }
              },
              child: const Text('Start Cooking', style: TextStyle(color: Color(0xFF48CFCB))),
            ),
          ],
        );
      },
    );
  }
}
