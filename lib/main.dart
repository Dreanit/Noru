import 'package:flutter/material.dart';
import 'package:noru/UI/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:noru/UI/loginscreen.dart';
import 'package:noru/helpers/Controllers/location_controller.dart';

import 'UI/dashboardScreens/shareride/selectLocationScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor:  Colors.grey.shade500,),
      home: LoginScreen(),
    );
  }
}
