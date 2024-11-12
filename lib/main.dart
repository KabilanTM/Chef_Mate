import 'package:flutter/material.dart';

import 'login_page.dart';

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
