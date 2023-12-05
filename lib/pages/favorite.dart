import 'package:e_cart1/pages/cart1.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // bottom: PreferredSize(
          //     preferredSize: Size.fromHeight(65),
          //     child: Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: TextField(
          //         decoration: InputDecoration(
          //           hintText: 'Search',
          //           prefixIcon: Icon(Icons.search),
          //           fillColor: Colors.white,
          //           contentPadding: EdgeInsets.zero,
          //           filled: true,
          //           border: OutlineInputBorder(
          //               borderSide: BorderSide.none,
          //               borderRadius: BorderRadius.circular(5)),
          //         ),
          //       ),
          //     ))


          ),
      body: Center(
        child: Text('Favorite Screen'),
      ),
    );
  }
}
