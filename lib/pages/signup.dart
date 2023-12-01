import 'package:e_cart1/pages/signin.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final   GlobalKey <FormState> _formField =GlobalKey<FormState>();

  late String name,email , Password;
 TextEditingController emailController= TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }
   bool passwordMatch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       size: 20,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Form(
           key: _formField,

          child: Container(
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
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Create an Account",
                          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          TextFormField(


                       validator: (value){
                        if(value!.isEmpty)
                        {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      onSaved: ( value){


                        name = value!;


                      }, decoration: InputDecoration(labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20) ),
                              prefixIcon:Icon(Icons.person),)

                            // decoration: InputDecoration(
                            //     labelText: 'Username',
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //       borderSide: BorderSide(color: Colors.black),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //       borderSide: BorderSide(color: Colors.blue),
                            //     ),
                            //     prefixIcon: Icon(Icons.person)),
                          ),




                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            
                               validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the email';
                        } else if (!isValidEmail(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                            controller: emailController,
                            decoration: InputDecoration(labelText: 'email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20) ),
                              prefixIcon:Icon(Icons.email),)
                            //  decoration: InputDecoration(
                            //     labelText: 'Email',
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //       borderSide: BorderSide(color: Colors.black),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //       borderSide: BorderSide(color: Colors.blue),
                            //     ),
                            //     prefixIcon: Icon(Icons.email)),
                            
                            
                            
                            

                           
                    
                        
                           
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: true,
                                          controller: password,
                                           validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the password';
                        } else if (value.length < 8) {
                          return 'Password should be at least 8 characters';
                        }
                        return null;
                      }, decoration: InputDecoration(labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20) ),
                              prefixIcon:Icon(Icons.lock),)
                                          
                            // decoration: InputDecoration(
                            //     labelText: 'Password',
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //       borderSide: BorderSide(color: Colors.black),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //       borderSide: BorderSide(color: Colors.blue),
                            //     ),
                            //     prefixIcon: Icon(Icons.lock)),

                           
                            
                          ),
                          //      ),
                          SizedBox(
                            height: 20,
                          ),
          
                          TextFormField(
                            controller: confirmpassword,
                           validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the confirm password';
                        } else if (!passwordMatch)  {
                          return 'password and confirm password mismatch';
                        }
                       
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20) ),
                              prefixIcon:Icon(Icons.lock),),
          
                              obscureText: true,
                              // decoration: InputDecoration(
                              //     labelText: 'Confirm Password',
                              //     enabledBorder: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(20),
                              //       borderSide: BorderSide(color: Colors.black),
                              //     ),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(20),
                              //       borderSide: BorderSide(color: Colors.blue),
                              //     ),
                              //     prefixIcon: (Icon(Icons.lock)))
                              )
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
                          onPressed: () { if (_formField.currentState!.validate()) {
                    setState(() {
                      passwordMatch = password.text ==
                          confirmpassword.text;
                    });
                    if (passwordMatch) {
                      // Continue with registration logic
                      print('Registration successful');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                    }
                                      password.clear();
                                      confirmpassword.clear();
                                      
          
                          return;
                        }else{
                          print("UnSuccessfull");
                        }},
                          color: Color(0xff0095FF),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Create",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            
                  
                          ),
                        ),
          
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
                        Text("Already have an account?"),
                        TextButton(
                            onPressed: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                             
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ))
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
