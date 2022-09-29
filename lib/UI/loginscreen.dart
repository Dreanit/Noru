import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noru/UI/dashboard.dart';
import 'package:noru/UI/signinscreen.dart';
import 'package:noru/Widgets/customtextfield.dart';
import 'package:noru/Widgets/loading_widget.dart';

import '../Authentication/authentication_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  AuthenticationManager _authDetails = AuthenticationManager();
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

                margin: EdgeInsets.zero,
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only( topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "Hello!!",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            fontFamily: "Playfair Display"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Welcome Back",
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
                          if (emailController.text.isEmpty) {
                            return "Email field can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      customTextField(
                        obscureText: true,
                        editingController: passwordController,
                        fieldTitle: "Enter Password",
                        titleText: "Password",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                      ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: const [
                      //     Text(
                      //       "Forgot Password?",
                      //       style: TextStyle(color: Colors.blue),
                      //     )
                      //   ],
                      // ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () async {
                            loadingWidgetWithContent(context: context);
                          try {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);
                                print(user);
                                print(user.user!.emailVerified);

                                if (user.user != null) {
                                  _authDetails
                                      .login(user.credential?.token.toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DashBoard()));
                                }
                              } on FirebaseAuthException catch (e) {
                                print(e);
                                print(e.code);
                                Navigator.pop(context);
                                if (e.code == 'user-not-found') {
                                  // print('No user found for that email.');
                                  const snackBar = SnackBar(
                                    content: Text("User not found!"),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                                if (e.code == 'wrong-password') {
                                  print(
                                      'Wrong password provided for that user.');
                                  const snackBar = SnackBar(
                                    content:
                                        Text("Invalid Email Id or Password"),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                                if (e.message ==
                                    "The password is invalid or the user does not have a password.") {
                                  print("object");
                                }
                                await FirebaseAuth.instance.signOut();
                              }
                            }
                          } catch (e) {
                            log(e.toString());
                            rethrow;
                          }
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15)),
                                height: 40,
                                child: const Center(
                                  child: Text(
                                    "Log In",
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
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            new SignInScreen()));
                              },
                              child: Text('Sign In'))
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
