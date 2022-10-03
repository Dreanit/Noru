import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:noru/Widgets/snackBar.dart';

import '../../../helpers/models/place_autocomplete_model.dart';
import 'selectLocationScreen.dart';

class ShareRide extends StatefulWidget {
  const ShareRide({Key? key}) : super(key: key);

  @override
  State<ShareRide> createState() => _ShareRideState();
}

class _ShareRideState extends State<ShareRide> {
  PlaceAutoComplete? fromLocation;
  PlaceAutoComplete? toLocation;
  DateTime dateSelected = DateTime.now();
  String TodayDate = DateFormat("dd MMM, yy").format(DateTime.now());
  String TomorrowDate = DateFormat("dd MMM, yy").format(DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1));
  String selectedDate = DateFormat("dd MMM, yy").format(DateTime.now());
  int personCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Image.asset('assets/findRideImage.jpg'),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () async {
                        fromLocation = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SelectLocationScreen();
                        }));
                        setState(() {
                          fromLocation;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.grey,
                          ),
                          fromLocation == null
                              ? Text(
                                  "Leaving From",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontFamily: "Aboreto"),
                                )
                              : Expanded(
                                  child: Text(
                                  "${fromLocation!.completeName}",
                                  softWrap: true,
                                    style: TextStyle(fontSize: 16),
                                )),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Divider(color: Colors.grey, thickness: 2),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () async {
                        toLocation = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SelectLocationScreen();
                        }));
                        setState(() {
                          toLocation;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.grey,
                          ),
                          toLocation == null
                              ? Text(
                                  "Going To",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontFamily: "Aboreto"),
                                )
                              : Expanded(
                                  child: Text(
                                  "${toLocation!.completeName}",
                                  softWrap: true,
                                    style: TextStyle(fontSize: 16),
                                )),
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
                              selectedDate =
                                  DateFormat("dd MMM, yy").format(dateSelected);
                            });
                          },
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month_rounded),
                              SizedBox(
                                width: 10,
                              ),
                              if (selectedDate == TodayDate) Text("Today"),
                              if (selectedDate == TomorrowDate)
                                Text("Tomorrow"),
                              if (selectedDate != TodayDate &&
                                  selectedDate != TomorrowDate)
                                Text("$selectedDate")
                            ],
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (personCount > 1) {
                                    personCount--;
                                  } else {
                                    snackbarGetx(
                                        title: "No!",
                                        content: " ",
                                        titleColor: Colors.red);
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.perm_identity),
                            Text("${personCount}"),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  personCount++;
                                });
                              },
                            )
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
            ),
          )
        ],
      ),
    );
  }
}
