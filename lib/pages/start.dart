import 'package:e_cart1/pages/signin.dart';
import 'package:e_cart1/pages/signup.dart';
import 'package:flutter/material.dart';

class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 10),
                // Text(
                //   "Hi Welcome",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     color: Colors.grey[700],
                //     fontSize: 15,
                //   ),
                // )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/ad/welcome.png"),
              )),
            ),
            Column(
              children: <Widget>[
                // the login button
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  // defining the shape
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50)),

                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                // creating the signup button
                SizedBox(height: 20),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  color: Color(0xff0095FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
