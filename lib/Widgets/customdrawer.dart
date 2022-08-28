import 'package:flutter/material.dart';

import '../UI/drawer/My Vehicles/myvehicles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
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
                      Container(
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
          ),          ListTile(
            onTap: () {},
            leading: Icon(Icons.star),
            title: Text('Rate Us'),
          ),          ListTile(
            onTap: () {},
            leading: Icon(Icons.details),
            title: Text('About Us'),
          ),          ListTile(
            onTap: () {},
            leading: Icon(Icons.question_answer),
            title: Text('FAQ'),
          ),
        ],
      ),
    );
  }
}
