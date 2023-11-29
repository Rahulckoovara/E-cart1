import 'package:e_cart1/pages/signin.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'Sachin Bansal',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            'Sachin Bansal@gmail.com',
            style: TextStyle(
              fontSize: 20,
            ),
          )),
          SizedBox(
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
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  icon: Icon(Icons.logout),
                  label: Text('Logout')),
              width: double.infinity,
              height: 50,
              color: Colors.grey[300],
            ),
          )
        ],
      ),
    );
  }
}
