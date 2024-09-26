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

import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> chekLocationCopy(BuildContext context) async {
  var status = await Permission.location.request();

  if (status.isGranted) {
    return await _checkGpsStatus(context); // Проверяем, включен ли GPS
  }

  if (status.isDenied || status.isPermanentlyDenied) {
    return false;
  }

  return false;
}

// Функция для проверки статуса GPS
Future<bool> _checkGpsStatus(BuildContext context) async {
  bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!isLocationServiceEnabled) {
    return false;
  }

  return true; // GPS включен
}
