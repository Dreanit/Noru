import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_webservice/src/places.dart';

import '../location_service.dart';
import '../models/place_autocomplete_model.dart';

class LocationController extends GetxController{

  Placemark _pickPlaceMark =Placemark();
  Placemark get pickPlaceMark=> _pickPlaceMark;
  List<PlaceAutoComplete> _predictionList=[];

  Future<List<PlaceAutoComplete>> searchLocation(BuildContext context, String text) async {

      http.Response response = await getLocationData(text);
      var data = jsonDecode(response.body.toString());
      if(response.body.contains("error") ){
        print("error");
        return [];
      }
      print("i am here 3");
      print("hiiii"+ data.toString());
      // print("my status is "+data);
      //   _predictionList = [];
      //   data['features'].forEach((prediction)
      //   => _predictionList.add(PlaceAutoComplete.fromJson(prediction)));
      try {
        List<PlaceAutoComplete> dataList = [];

        for (var json in data['features']) {
          PlaceAutoComplete data = PlaceAutoComplete.fromJson(json["properties"]);

          dataList.add(data);
        }
        return dataList;
      } catch (e) {
        print(e);
        rethrow;
      }

    return _predictionList;
  }
}