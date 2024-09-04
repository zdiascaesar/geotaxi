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

Future<bool> chekLocationPermission(BuildContext context) async {
  var status = await Permission.location.request();

  if (status.isGranted) {
    return true;
  }

  if (status.isDenied || status.isPermanentlyDenied) {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF141414),
          title: Text(
            'Access to locations',
            style: TextStyle(color: Color(0xFFFAFAFA)),
          ),
          content: Text(
            'To use the map, you must provide access to the location. Please allow access in settings.',
            style: TextStyle(color: Color(0xFFFAFAFA)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No, thanks',
                style: TextStyle(color: Color(0xFFFAFAFA)),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await openAppSettings();
              },
              child: Text(
                'Ok',
                style: TextStyle(color: Color(0xFFFAFAFA)),
              ),
            ),
          ],
        );
      },
    );
    return false;
  }

  return false;
}
