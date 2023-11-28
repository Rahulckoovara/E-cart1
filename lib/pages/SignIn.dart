import 'package:e_cart1/pages/Front.dart';
import 'package:e_cart1/pages/signup.dart';
import 'package:flutter/material.dart';
//import '../pages/signin.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login to your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Email"),
                      inputFile(label: "Password", obscureText: true)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {},
                        color: Color(0xff0095FF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Front()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )

                      // "Login",
                      // style: TextStyle(
                      //   fontWeight: FontWeight.w600,
                      //   fontSize: 18,
                      //   color: Colors.white,
                      // ),
                      // ),
                      // ),
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          " Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ))
                    // Text(
                    //   " Sign up",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: 18,
                    //   ),
                    // )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background.png"),
                        fit: BoxFit.fitHeight),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    ));
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            border: OutlineInputBorder(borderSide: BorderSide())),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );

//         // backgroundColor: Colors.blue[200],
//         // children: [
//         //   SizedBox(
//         //     width: 10,
//         //     child: Padding(
//         //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
//           child: Column(
//             children: [
//               SizedBox(
//                 width: double.infinity,
//               ),

//               Text(
//                 'Welcome Back',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 'Sign in with your email and password',
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               // TextFormField(
//               //   decoration: InputDecoration(
//               //       hintText: 'Enter Your Email',
//               //       labelText: 'Email',
//               //       floatingLabelBehavior: FloatingLabelBehavior.always,
//               //       contentPadding:
//               //           EdgeInsets.symmetric(horizontal: 45, vertical: 20),
//               //       enabledBorder: OutlineInputBorder(
//               //         borderRadius: BorderRadius.circular(20),
//               //         borderSide: BorderSide(color: Colors.black),
//               //         gapPadding: 10,
//               //       ),
//               //       focusedBorder: OutlineInputBorder(
//               //           borderRadius: BorderRadius.circular(20),
//               //           borderSide: BorderSide(color: Colors.black),
//               //           gapPadding: 10)),
//               // )
//               SignForm()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignForm extends StatefulWidget {
//   const SignForm({super.key});

//   @override
//   State<SignForm> createState() => _SignFormState();
// }

// class _SignFormState extends State<SignForm> {
//   final _formkey = GlobalKey<FormState>();
//   final List<String> errors = [];
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formkey,
//       child: Column(
//         children: [
//           getEmailFormField(),
//           SizedBox(height: 15),
//           TextFormField(
//             obscureText: true,
//             decoration: InputDecoration(
//                 hintText: 'Enter Your Password',
//                 labelText: 'Password',
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 45, vertical: 20),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                   borderSide: BorderSide(color: Colors.black),
//                   gapPadding: 10,
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(color: Colors.black),
//                     gapPadding: 10),
//                 suffixIcon: Icon(Icons.lock)),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [Icon(Icons.error)],
//           ),
//           Container(
//             child: ElevatedButton(onPressed: () {}, child: Text('Continue')),
//             color: Colors.orange,
//           )
//         ],
//       ),
//     );
//   }

//   TextFormField getEmailFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       validator: (value) {
//         if (value!.isEmpty) {
//           setState(() {
//             errors.add('Email is required');
//           });
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//           hintText: 'Enter Your Email',
//           labelText: 'Email',
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(color: Colors.black),
//             gapPadding: 10,
//           ),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide(color: Colors.black),
//               gapPadding: 10),
//           suffixIcon: Icon(Icons.email)),
//     );
//   }
//}
}
