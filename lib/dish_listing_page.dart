import 'package:flutter/material.dart';
import 'recipes.dart';
import 'cooking_page.dart';

class DishListingPage extends StatelessWidget {
  const DishListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ChefMate")),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            color: Colors.brown[200],
            child: ListTile(
              leading: const Icon(Icons.restaurant, color: Colors.deepOrange),
              title: Text(recipe.name),
              onTap: () {
                _showPersonCountDialog(context, recipe);
              },
            ),
          );
        },
      ),
    );
  }

  void _showPersonCountDialog(BuildContext context, Recipe recipe) {
    int personCount = 1;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter Number of People"),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Enter a number"),
            onChanged: (value) {
              personCount = int.tryParse(value) ?? 1;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CookingPage(recipe: recipe, personCount: personCount),
                  ),
                );
              },
              child: const Text("Start Cooking"),
            ),
          ],
        );
      },
    );
  }
}
