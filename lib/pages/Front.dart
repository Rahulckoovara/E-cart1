import 'package:e_cart1/pages/HomeScreen.dart';
import 'package:e_cart1/pages/ProfileScreen.dart';
import 'package:e_cart1/pages/favorite.dart';
import 'package:flutter/material.dart';

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  State<Front> createState() => _Front();
}

class _Front extends State<Front> {
  int currentIndex = 0;
  List Screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentIndex],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('E-Kart'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ]),
    );
  }
}
