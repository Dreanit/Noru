import 'package:flutter/material.dart';

class LeavingFromScreen extends StatefulWidget {
  const LeavingFromScreen({Key? key}) : super(key: key);

  @override
  State<LeavingFromScreen> createState() => _LeavingFromScreenState();
}

class _LeavingFromScreenState extends State<LeavingFromScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [TextFormField()],
          ),
        ),
      ),
    );
  }
}
