import 'package:flutter/material.dart';
import 'recipes.dart';
import 'cooking_page.dart';

class RecipeListingPage extends StatelessWidget {
  const RecipeListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allow body to extend behind the AppBar
      backgroundColor: Colors.transparent, // Make the background color transparent to show the image
      appBar: AppBar(
        title: const Text('Recipes', style: TextStyle(color: Color(0xFF229799))),
        backgroundColor: Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Remove the shadow from the AppBar
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/list_bg.jpg'), // Set the background image
            fit: BoxFit.cover, // Make the image cover the whole screen
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
                // Validate input to ensure it's a positive integer
                String input = personController.text.trim();
                if (input.isEmpty || int.tryParse(input) == null || int.parse(input) <= 0) {
                  // Show an error message if the input is invalid
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
