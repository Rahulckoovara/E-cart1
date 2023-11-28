import 'package:e_cart1/pages/Front.dart';
import 'package:e_cart1/pages/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Front(),
    );
  }
}
