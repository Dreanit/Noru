import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noru/helpers/Controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_webservice/places.dart';


class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({Key? key}) : super(key: key);

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  late CameraPosition _cameraPosition;
  @override
  void initState() {
    super.initState();
    _cameraPosition = CameraPosition(target: LatLng(22.717, 75.8337), zoom: 17);
  }

  late GoogleMapController _mapController;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return Scaffold(
        body: Stack(
          children: [
            GoogleMap(
                onMapCreated: (GoogleMapController mapController) {
                  _mapController = mapController;
                  // CameraPosition.fromMap(mapController);
                  // locationController.setMapController(mapController);
                },
                initialCameraPosition: _cameraPosition),
            Container(
              margin: EdgeInsets.only(top: 150),
              padding: EdgeInsets.all(5),
              alignment: Alignment.topCenter,
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: SizedBox(
                    width: 350,
                    child: TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _controller,
                        textInputAction: TextInputAction.search,
                        autofocus: true,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          hintText: 'search_location',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(style: BorderStyle.none, width: 0),
                          ),
                          hintStyle:
                              Theme.of(context).textTheme.headline2?.copyWith(
                                    fontSize: 16,
                                    color: Theme.of(context).disabledColor,
                                  ),
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                        ),
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyText1?.color,
                              fontSize: 20,
                            ),
                      ),
                      suggestionsCallback: (pattern) async {
                        return await Get.find<LocationController>()
                            .searchLocation(context, pattern);
                      },
                      itemBuilder: (context, Prediction suggestion) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            Icon(Icons.location_on),
                            Expanded(
                              child: Text(suggestion.description!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.color,
                                        fontSize: 16,
                                      )),
                            ),
                          ]),
                        );
                      },
                      onSuggestionSelected: (Prediction suggestion) {
                        log("My location is " + suggestion.placeId.toString());
                        log("My location is " + suggestion.toString());
                        log("My location is " + suggestion.reference.toString());
                        // Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);
                        Navigator.pop(context, suggestion);
                      },
                    )),
              ),
            )
          ],
        ),
      );
    });
  }
}
