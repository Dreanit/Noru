import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> getLocationData(String text) async {
  http.Response response;

  response = await http.get(
    Uri.parse("https://api.geoapify.com/v1/geocode/autocomplete?text=${text}&apiKey=29135682badd4252a267fe45e8c5229b"),
    headers: {"Content-Type": "application/json"},);

  // print(jsonDecode(response.body));
  return response;
}