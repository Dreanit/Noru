import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:noru/UI/dashboardScreens/post_ride/calculate_possible_route_screen.dart';
import 'package:noru/UI/dashboardScreens/shareride/selectLocationScreen.dart';
import 'package:noru/Widgets/customdrawer.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noru/helpers/models/place_autocomplete_model.dart';

class PostRideScreen extends StatefulWidget {
  const PostRideScreen({Key? key}) : super(key: key);

  @override
  State<PostRideScreen> createState() => _PostRideScreenState();
}

class _PostRideScreenState extends State<PostRideScreen> {
  PlaceAutoComplete? fromLocation;
  PlaceAutoComplete? toLocation;
  double startLongitude = 0.00;
  double startLatitude = 0.00;
  double destinationLongitude = 0.00;
  double destinationLatitude = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.grey[300],
      ),
      drawer: CustomDrawer(),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pick-up",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  fromLocation = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return SelectLocationScreen();
                  }));
                  setState(() {
                    fromLocation;
                    startLongitude = fromLocation?.lon ?? 0.00;
                    startLatitude = fromLocation?.lat ?? 0.00;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Last Drop Location",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  toLocation = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return SelectLocationScreen();
                  }));
                  setState(() {
                    toLocation;
                    destinationLatitude = toLocation?.lat ?? 0.00;
                    destinationLongitude = toLocation?.lon ?? 0.00;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: Colors.grey,
                        ),
                        toLocation == null
                            ? Text(
                                "Going to",
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
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CalculateRouteScreen(
                              toLocation: toLocation!,
                              fromLocation: fromLocation!,
                              startLatitude: startLatitude,
                              startLongitude: startLongitude,
                              destinationLongitude: destinationLongitude,
                              destinationLatitude: destinationLatitude);
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
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