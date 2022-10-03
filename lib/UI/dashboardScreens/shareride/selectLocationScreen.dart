import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noru/helpers/Controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_webservice/places.dart';

import '../../../helpers/models/place_autocomplete_model.dart';

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

  PlaceAutoComplete? data;
  late GoogleMapController _mapController;
  final TextEditingController _controller = TextEditingController();
  double latitude = 0.00;
  double longitude = 0.00;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
       return Scaffold(
        body: Stack(
          children: [
            GoogleMap(
                markers: {
                  Marker(
                      markerId: MarkerId("marker"),
                      position: LatLng(latitude, longitude),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed))
                },
                onMapCreated: (GoogleMapController mapController) {
                  _mapController = mapController;

                  _mapController.animateCamera(CameraUpdate.zoomIn());
                },
                  mapType: MapType.satellite,
                initialCameraPosition: _cameraPosition),
            Container(
              margin: EdgeInsets.only(top: 150),
              padding: EdgeInsets.all(5),
              alignment: Alignment.topCenter,
              child: Material(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _controller,
                        textInputAction: TextInputAction.search,
                        autofocus: true,
                        minLines: 1,
                        maxLines: 5,
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
                        style: TextStyle(
                          fontFamily: "OpenSans",
                        ),
                      ),
                      suggestionsCallback: (pattern) async {
                        return await Get.find<LocationController>()
                            .searchLocation(context, pattern);
                      },
                      itemBuilder: (context, PlaceAutoComplete suggestion) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.location_on),
                              Expanded(
                                child: Text(suggestion.completeName ?? "asdbi",
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
                                            fontFamily: "OpenSans")),
                              ),
                            ],
                          ),
                        );
                      },
                      onSuggestionSelected:
                          (PlaceAutoComplete suggestion) async {
                        setState(() {
                          _controller.text = suggestion.completeName ?? "";
                          // Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);
                          // Navigator.pop(context, suggestion);
                          latitude = suggestion.lat ?? 0.00;
                          longitude = suggestion.lon ?? 0.00;
                          print(latitude);
                          data = suggestion;
                          print(longitude);
                        });
                        _mapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(suggestion.lat ?? 0.00,
                                  suggestion.lon ?? 0.00),
                              zoom: 18.0,
                            ),
                          ),
                        );
                      },
                    )),
              ),
            ),
            PositionedDirectional(
              bottom: 60,
              start: 120,
              child: (latitude == 0.00 || longitude == 0.00)
                  ? Container()
                  : GestureDetector(
                onTap: (){
                 Navigator.pop(context,data);
                },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          child: Text(
                            "Confirm Location",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                  ),
            )
          ],
        ),
      );
    });
  }
}
