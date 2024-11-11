import 'package:flutter/material.dart';
import 'recipe_listing_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('ChefMate', style: TextStyle(color: Color(0xFF229799))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF48CFCB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeListingPage()));
          },
          child: Text('View Recipes', style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}
