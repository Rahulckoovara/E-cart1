import 'package:e_cart1/model/Product.dart';
import 'package:e_cart1/model/my_product.dart';
import 'package:e_cart1/pages/HomeScreen.dart';
import 'package:e_cart1/pages/ProfileScreen.dart';
import 'package:e_cart1/pages/cart1.dart';
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

      appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: Container(),
          title: Text(
            'E-Kart',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart1()));
                })
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.zero,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ))

          //   child:Row(
          //     children: [
          //       Text('E-Kart', style: TextStyle(color: Colors.white, fontSize: 30),),
          // IconButton(
          //     icon: Icon(
          //       Icons.shopping_cart,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (context) => Cart()));
          //     })
          //     ],
          //   )
          // )
          // title: Text(
          //   'E-Kart',
          //   style: TextStyle(color: Colors.white, fontSize: 30),
          // ),
          // centerTitle: true,
          // actions: [
          // Row(children: [

          // ]),
          // Row(
          //   children: [
          //     TextField(
          // decoration: InputDecoration(
          //     hintText: 'search',
          //     fillColor: Colors.white,
          //     filled: true,
          //     border: OutlineInputBorder()),

          //   ],
          // )
          // Column(
          //   children: [
          // ,
          // IconButton(
          //     icon: Icon(
          //       Icons.shopping_cart,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (context) => Cart()));
          //     })
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Container(
          //       width: 120,
          //       child: TextField(
          //         decoration: InputDecoration(
          //             hintText: 'search',
          //             fillColor: Colors.white,
          //             filled: true,
          //             border: OutlineInputBorder()),
          //       ),
          //     )
          //     // Expanded(
          //     //   child: TextField(
          //     //     decoration: InputDecoration(
          //     //         hintText: 'search',
          //     //         fillColor: Colors.white,
          //     //         //filled: true,
          //     //         border: OutlineInputBorder()),
          //     //   ),
          //     // ),
          //   ],
          // ),
          //],

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
