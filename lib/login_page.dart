import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
            children: [
              Image.asset('assets/ChefMate.jpg'),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Mastering Meals Made Easy: ChefMate, the Cooking Coach You Need",
                  textAlign: TextAlign.center, // Center-align the text
                  style: TextStyle(
                    color: Color.fromARGB(255, 100, 177, 173), // Set the text color to red
                    fontSize: 18, // Optional: Adjust the font size 
                    fontWeight: FontWeight.bold, // Optional: Make the text bold
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add some space between the text and the button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF48CFCB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  "Let's get started!",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
