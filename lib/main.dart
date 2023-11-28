import 'package:e_cart1/pages/Front.dart';
import 'package:e_cart1/pages/HomeScreen.dart';
import 'package:e_cart1/pages/cart.dart';
import 'package:e_cart1/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_cart1/providers/cart_provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
