import 'dart:async';

import 'package:e_cart1/pages/SignIn.dart';
import 'package:e_cart1/pages/Front.dart';
import 'package:e_cart1/pages/HomeScreen.dart';
import 'package:e_cart1/pages/start.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay and navigate to the home screen
    Timer(Duration(seconds: 0), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => start()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your app logo or any other splash screen content here
            Image.asset(
              'assets/ad/ekart.png', // Replace with the actual path to your logo
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(),
            // Text(
            //   'E-Kart',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
