import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noru/UI/loginscreen.dart';

import '../Widgets/customtextfield.dart';
import 'dashboard.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool tncCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: AppBar(title: const Text("Login Screen")),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Image.asset('assets/NoruAppLogo.png',scale: 4.5,),
              Card(
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
                elevation: 10,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "Welcome!",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            fontFamily: "Playfair Display"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Create an account  ",
                        style: TextStyle(color: Colors.grey, fontSize: 22,fontFamily: "Playfair Display"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      customTextField(
                        obscureText: false,
                        editingController: emailController,
                        fieldTitle: "Enter Email",
                        titleText: "Email",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email address';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      customTextField(
                        editingController: passwordController,
                        fieldTitle: "Enter Password",
                        titleText: "Create Password",
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Password field can't be empty";
                          }
                          if(value.length<6){
                            return "Password must be minimum 6 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      customTextField(
                        obscureText: true,
                        editingController: confirmPasswordController,
                        fieldTitle: "Enter Password",
                        titleText: "Re-enter Password",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Password field can't be empty";
                          }
                          if(passwordController.text != confirmPasswordController.text){
                            return "Both password's don't match";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: tncCheckbox,
                              onChanged: (value) {
                                setState(() {
                                  tncCheckbox = value!;
                                });
                              }),
                          const Text('I agree with'),
                          const Text(
                            'Terms & Conditions',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          // try {
                          //  if(tncCheckbox){
                          //
                          //  }
                          // } catch (e) {
                          //   log(e.toString());
                          //   rethrow;
                          // }
                          if (_formKey.currentState!.validate()) {
                            // use the information provided
                            emailController;
                          }
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        tncCheckbox ? Colors.blue : Colors.grey,
                                    borderRadius: BorderRadius.circular(15)),
                                height: 40,
                                child: const Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 7.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const Text('Sign In'))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
