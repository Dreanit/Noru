import 'dart:developer';

class PlaceAutoComplete {
  String? name;
  String? city;
  String? street;
  String? postcode;
  double? lat;
  double? lon;
  String? completeName;

  PlaceAutoComplete({
    this.name,
    required this.city,
    required this.street,
    required this.lat,
    required this.lon,
    required this.completeName,
    required this.postcode,
  });

  factory PlaceAutoComplete.fromJson(Map<String, dynamic> json) {
    return PlaceAutoComplete(
      name: json["name"],
      completeName: json["formatted"],
      lon: json["lon"],
      lat: json["lat"],
      postcode: json["postcode"],
      street: json["street"],
      city: json["city"],
    );
  }
}
