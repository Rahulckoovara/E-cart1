import 'package:e_cart1/pages/cart1.dart';
import 'package:e_cart1/pages/signin.dart';
import 'package:flutter/material.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              // child: Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: 'Search',
              //       prefixIcon: Icon(Icons.search),
              //       fillColor: Colors.white,
              //       contentPadding: EdgeInsets.zero,
              //       filled: true,
              //       border: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           borderRadius: BorderRadius.circular(5)),
              //     ),
              //   ),
              //)
             // )


          ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 15),
            child: CircleAvatar(
              radius: 63,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 60,
                foregroundImage: AssetImage('assets/ad/person.png'),
              ),
            ),
          ),



          Center(
              child: Text(
            'Peter  Parker',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
          )

          ,
          Center(
              child: Text(
            'Spider@gmail.com',
            style: TextStyle(
              fontSize: 20,
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text('My Orders'),
            leading: Icon(Icons.shopping_bag_outlined),
          ),
          ListTile(
            title: Text('Coupons'),
            leading: Icon(Icons.card_giftcard_sharp),
          ),
          ListTile(
            title: Text('E-Kart Plus'),
            leading: Icon(Icons.offline_bolt_sharp),
          ),
         SizedBox(
            height: MediaQuery.of(context).size.height/8,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: MediaQuery.of(context).size.height/14,
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  icon: Icon(Icons.logout),
                  label: Text('Logout')),
              width: double.infinity,
           //   height: 50,
              color: Colors.grey[300],
            ),
          )
        ],
      ),
    );
  }
}
