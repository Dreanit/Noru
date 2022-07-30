import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: const Text("Login Screen")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/noru_logo.jpeg'),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
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
                      height: 15,
                    ),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.grey, fontSize: 19),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      emailController: emailController,
                      fieldTitle: "Enter Email",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      emailController: passwordController,
                      fieldTitle: "Enter Password",
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15)),
                            height: 40,
                            child: const Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  const TextField({
    Key? key,
    required this.emailController,
    required this.fieldTitle,
  }) : super(key: key);
  final String fieldTitle;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: fieldTitle,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
