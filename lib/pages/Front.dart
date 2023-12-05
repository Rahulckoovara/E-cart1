import 'package:e_cart1/model/Product.dart';
import 'package:e_cart1/model/my_product.dart';
import 'package:e_cart1/pages/HomeScreen.dart';
import 'package:e_cart1/pages/ProfileScreen.dart';
//import 'package:e_cart1/pages/cart2.dart';
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

  List<Product> allProducts = MyProducts.allProducts;

  List<Product> searchResults = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentIndex],


      // currentIndex == 0 ? _buildSearchResults() :

     
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

  // void onSearchTextChanged(String query) {
  //   searchResults.clear();
  //   if (query.isNotEmpty) {
  //     searchResults = allProducts
  //         .where((product) =>
  //             product.name.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   }
  //   setState(() {});
  // }

  // Widget _buildSearchResults() {
  //   return ListView.builder(
  //     itemCount: searchResults.length,
  //     itemBuilder: (context, index) {
  //       final product = searchResults[index];
  //       return ListTile(
  //         title: Text(product.name),
  //         // Add more details or navigate to a details page if needed
  //       );
  //     },
  //   );
  // }
}
