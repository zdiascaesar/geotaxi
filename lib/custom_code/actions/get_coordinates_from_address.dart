// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;

Future<LatLng?> getCoordinatesFromAddress(String? address) async {
  final url = Uri.parse(
      'https://api.mapbox.com/search/geocode/v6/forward?q=$address&limit=1&access_token=pk.eyJ1IjoiNmVremhhbiIsImEiOiJjbHppM214dWswYjB1MmtzNDRsdno4ZmFxIn0.LVh6MJeD2z0AViZebxN1-A');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data != null &&
          data['features'] != null &&
          data['features'].isNotEmpty) {
        final longitude = data['features'][0]['geometry']['coordinates'][0];
        final latitude = data['features'][0]['geometry']['coordinates'][1];
        print(data);
        return LatLng(latitude, longitude);
      } else {
        print('Address not found.');
      }
    } else {
      print('Error loading coordinates: ${response.body}');
    }
  } catch (e) {
    print('Error fetching coordinates: $e');
  }
  return null;
}
