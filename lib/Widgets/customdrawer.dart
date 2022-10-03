import 'package:flutter/material.dart';
import 'package:noru/Authentication/authentication_manager.dart';
import 'package:noru/UI/drawer/UserProfile.dart';
import 'package:noru/UI/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../UI/drawer/My Vehicles/View/myvehicles.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    Key? key,
  }) : super(key: key);
  AuthenticationManager _authenticationManager = AuthenticationManager();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 30,
      backgroundColor: Colors.grey[300],
      child: ListView(
        children: [
          Container(
            color: Color(0xff1fa1a1),
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/profile.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dreanit',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return UserProfile();
                              },
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8),
                            child: Text(
                              'My Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyVehiclesScreen();
              }));
            },
            leading: Icon(Icons.car_crash),
            title: Text('My Vehicles'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.list_alt),
            title: Text('Ride History'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.support_agent),
            title: Text('Support & Help'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.share),
            title: Text('Invite Friends'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.star),
            title: Text('Rate Us'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.details),
            title: Text('About Us'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.question_answer),
            title: Text('FAQ'),
          ),
          ListTile(
            onTap: () {
              _auth.signOut();
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }), (route) => route.isFirst);
            },
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
