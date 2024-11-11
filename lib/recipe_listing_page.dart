import 'package:flutter/material.dart';
import 'recipes.dart';
import 'cooking_page.dart';

class RecipeListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Recipes', style: TextStyle(color: Color(0xFF229799))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(Icons.fastfood, color: Color(0xFF48CFCB)),
                title: Text(
                  recipes[index].name,
                  style: TextStyle(color: Color(0xFF424242), fontSize: 18),
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

  void _showPersonDialog(BuildContext context, Recipe recipe) {
    final TextEditingController _personController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFF5F5F5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Enter number of persons', style: TextStyle(color: Color(0xFF229799))),
          content: TextField(
            controller: _personController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Number of persons'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                int personCount = int.parse(_personController.text);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CookingPage(recipe: recipe, personCount: personCount),
                  ),
                );
              },
              child: Text('Start Cooking', style: TextStyle(color: Color(0xFF48CFCB))),
            ),
          ],
        );
      },
    );
  }
}
