import 'package:flutter/material.dart';
import 'recipe_listing_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows the body to extend behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Makes the AppBar background transparent
        title: const Text('ChefMate', style: TextStyle(color: Color(0xFF229799))),
        elevation: 0, // Removes the AppBar shadow
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_background.png'), // Background image
            fit: BoxFit.cover, // Makes the image cover the entire screen
          ),
        ),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF48CFCB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RecipeListingPage()));
            },
            child: const Text('View Recipes', style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
