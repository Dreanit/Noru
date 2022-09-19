import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'leavingfromscreen.dart';

class ShareRide extends StatefulWidget {
  const ShareRide({Key? key}) : super(key: key);

  @override
  State<ShareRide> createState() => _ShareRideState();
}

class _ShareRideState extends State<ShareRide> {
  DateTime dateSelected = DateTime.now();
  String TodayDate = DateFormat("dd MMM, yy").format(DateTime.now());
  String selectedDate = DateFormat("dd MMM, yy").format(DateTime.now());
  int personCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/findRideImage.jpg'),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return LeavingFromScreen();
                            }));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_sharp,
                                color: Colors.grey,
                              ),
                              Text(
                                "Leaving From",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontFamily: "Aboreto"),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          child: Divider(color: Colors.grey, thickness: 2),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_sharp,
                                color: Colors.grey,
                              ),
                              Text(
                                "Going To",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontFamily: "Aboreto"),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          child: Divider(color: Colors.grey, thickness: 2),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                dateSelected = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2100)) ??
                                    DateTime.now();
                                setState(() {
                                  selectedDate = DateFormat("dd MMM, yy")
                                      .format(dateSelected);
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_month_rounded),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(selectedDate == TodayDate
                                      ? "Today"
                                      : "${selectedDate}")
                                ],
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: const [
                                Icon(Icons.remove),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.perm_identity),
                                Text("1"),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.add)
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: double.infinity,
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10),
                            child: Text(
                              "Find",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "PT Serif"),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        // Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
