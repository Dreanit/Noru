import 'package:flutter/material.dart';
import 'package:noru/UI/dashboard.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Text(
          "User Profile",
          style: TextStyle(
              fontFamily: "openSans",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                child: Image.asset('assets/profile.png'),
              ),
            ],
          ),
          SizedBox(height: 50,),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
              child: Column(
                children: [
                  Row(
                    children:const [
                      Text(
                        "Contact Details",
                        style: TextStyle(
                          fontFamily: "PT Serif",
                          fontSize: 20,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          indent: 5.0,
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.person),
                      Text("Name:",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                      SizedBox(width: 15,),
                      Text("Dreanit",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.call),
                      Text("Contact number:",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                      SizedBox(width: 15,),
                      Text("8544126598",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.email),
                      Text("Email:",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                      SizedBox(width: 15,),
                      Text("dreanit@noru.in",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
              child: Column(
                children: [
                  Row(
                    children:const [
                      Text(
                        "Payment Details",
                        style: TextStyle(
                          fontFamily: "PT Serif",
                          fontSize: 20,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          indent: 5.0,
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee),
                      Text("Balance:",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                      SizedBox(width: 15,),
                      Text("500",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.account_box),
                      Text("UPI ID:",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                      SizedBox(width: 15,),
                      Text("8544126598@paytm",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.email),
                      Text("Email:",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                      SizedBox(width: 15,),
                      Text("dreanit@noru.in",style: TextStyle(fontFamily: "openSans",fontSize: 16),),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
