import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const ChefMateApp());
}

class ChefMateApp extends StatelessWidget {
  const ChefMateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChefMate',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
