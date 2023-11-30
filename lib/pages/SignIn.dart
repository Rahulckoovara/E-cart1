import 'package:e_cart1/pages/Front.dart';
import 'package:e_cart1/pages/signup.dart';
import 'package:flutter/material.dart';
//import '../pages/signin.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final   GlobalKey <FormState> _formField =GlobalKey<FormState>();

  late String email , Password;
  final emailController= TextEditingController();
  final passwordController= TextEditingController();
  bool passwordToggle=true;
  //bool emailValid = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value);

 // bool emailValid=RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value);
  
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
    
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Form(
            key: _formField,
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
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
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
                        children: [
                          TextFormField(
            
                            
                            keyboardType: TextInputType.emailAddress,
                           controller: emailController ,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                prefixIcon: Icon(Icons.email)
            
                                // gapPadding: 10)
                                //       floatingLabelBehavior: FloatingLabelBehavior.always,
                                //                 contentPadding:
                                //                     EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                                //                 enabledBorder: OutlineInputBorder(
                                //                   borderRadius: BorderRadius.circular(20),
                                //                   borderSide: BorderSide(color: Colors.black),
                                //                   gapPadding: 10,
                                //                 ),
                                //                 focusedBorder: OutlineInputBorder(
                                //                     borderRadius: BorderRadius.circular(20),
                                //                     borderSide: BorderSide(color: Colors.b
                                //                     gapPadding: 10),
                                //                 suffixIcon: Icon(Icons.lock)),
                                ),
                              validator: ( value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Email';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: ( value){
                      email = value!;
                    },
                  
                
                              
                          ),
                          //      ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please Enter Password'; 
                              }
                              return null;
                            },
                            
                            controller: passwordController,
                              obscureText: passwordToggle,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  prefixIcon: Icon(Icons.lock),
                                  suffix: InkWell(
                                    onTap: (){
                                      setState(() {
                                         passwordToggle=!passwordToggle;
                                      });
                                     
                                    },
                                    child: Icon(passwordToggle ? Icons.visibility: Icons.visibility_off_sharp),
                                    
                                  )
                                  //   : Icon(Icons.lock)
                                  ))
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
                          child: InkWell(
                            onTap:(){
                              
                            } ,
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
                                  if(_formField.currentState!.validate()){
                                 
                                   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Front())
                                          
                                          );
                                             emailController.clear();
                                passwordController.clear();
                                  }
                                  else{
                                    print('unsuccesful');
                                  }
                                
                              
                              
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
                              "Sign up",
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
                      height: 240,
                      width: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/ad/background.png"),
                            fit: BoxFit.cover),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
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
}
