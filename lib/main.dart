import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';

void main() {
  runApp(const ChefMateApp());
}

class ChefMateApp extends StatelessWidget {
  const ChefMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChefMate',
      theme: ThemeData.dark(),
      home: const LoginPage(),
    );
  }
}
