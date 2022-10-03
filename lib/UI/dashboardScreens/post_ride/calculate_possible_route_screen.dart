import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noru/helpers/Controllers/location_controller.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:noru/helpers/models/place_autocomplete_model.dart';

class CalculateRouteScreen extends StatefulWidget {
  CalculateRouteScreen({
    Key? key,
    required this.toLocation,
    required this.fromLocation,
    required this.startLatitude,
    required this.startLongitude,
    required this.destinationLongitude,
    required this.destinationLatitude,
  }) : super(key: key);
  double startLongitude = 0.00;
  double startLatitude = 0.00;
  double destinationLongitude = 0.00;
  double destinationLatitude = 0.00;
  PlaceAutoComplete fromLocation;
  PlaceAutoComplete toLocation;
  @override
  State<CalculateRouteScreen> createState() => _CalculateRouteScreenState();
}

class _CalculateRouteScreenState extends State<CalculateRouteScreen> {
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyCT3-m0f_x1uVd2YF5KQCnu6VU9gyYeYcQ";

  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction


  double distance = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    markers.add(Marker( //add start location marker
      markerId: MarkerId(widget.fromLocation.name.toString()),
      position: LatLng(widget.startLatitude,widget.startLongitude), //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'Starting Point ',
        snippet: 'Start Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    markers.add(Marker( //add distination location marker
      markerId: MarkerId(widget.toLocation.name.toString()),
      position: LatLng(widget.destinationLatitude,widget.destinationLongitude), //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'Destination Point ',
        snippet: 'Destination Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    // print("here"+widget.startLongitude.toString());
    getDirections();
   print( calculateDistance(widget.startLatitude,widget.startLongitude, widget.destinationLatitude,widget.destinationLongitude));
   super.initState();
  }
  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(widget.startLatitude, widget.startLongitude),
      PointLatLng(widget.destinationLatitude, widget.destinationLongitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    //polulineCoordinates is the List of longitute and latidtude.
    double totalDistance = 0;
    for(var i = 0; i < polylineCoordinates.length-1; i++){
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i+1].latitude,
          polylineCoordinates[i+1].longitude);
    }
    print(totalDistance);

    setState(() {
      distance = totalDistance;
    });

    //add to the list of poly line coordinates
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<LocationController>(builder: (locationController) {


    return Scaffold(
      body: Stack(
        children: [
          GoogleMap( //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition( //innital position in map
              target: LatLng(widget.startLatitude,widget.startLongitude), //initial position
              zoom: 14.0, //initial zoom level
            ),
            markers: markers, //markers to show on map
            polylines: Set<Polyline>.of(polylines.values), //polylines
            mapType: MapType.normal, //map type
            onMapCreated: (controller) { //method called when map is created
              setState(() {
                _mapController = controller;
              });
            },
          ),

          Positioned(
              bottom: 200,
              left: 50,
              child: Container(
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text("Total Distance: " + distance.toStringAsFixed(2) + " KM",
                            style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold))
                    ),
                  )
              )
          )
        ],
      ),
    );
    // });
  }
}
