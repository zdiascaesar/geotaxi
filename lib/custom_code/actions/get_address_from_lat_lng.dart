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
import 'dart:convert';

Future<String> getAddressFromLatLng(LatLng geolocation) async {
  final String accessToken =
      'pk.eyJ1IjoiNmVremhhbiIsImEiOiJjbHppM214dWswYjB1MmtzNDRsdno4ZmFxIn0.LVh6MJeD2z0AViZebxN1-A'; // Замените на ваш Mapbox access token
  final String url =
      'https://api.mapbox.com/geocoding/v5/mapbox.places/${geolocation.longitude},${geolocation.latitude}.json?access_token=$accessToken';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['features'].isNotEmpty) {
      return data['features'][0]
          ['place_name']; // Возвращаем первый найденный адрес
    } else {
      return "Адрес не найден";
    }
  } else {
    print('Ошибка: ${response.statusCode}');
    return "Ошибка при получении данных";
  }
}
