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
  var status = await Permission.location.status;

  while (!status.isGranted) {
    await showDialog(
      barrierDismissible:
          false, // Prevents dismissing the dialog by tapping outside
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          // Prevents dismissing the dialog by pressing the back button
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: Color(0xFF141414),
            title: Text(
              'Access to Location',
              style: TextStyle(color: Color(0xFFFAFAFA)),
            ),
            content: Text(
              'To use the app, you must provide access to your location. Please allow access in settings.',
              style: TextStyle(color: Color(0xFFFAFAFA)),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await openAppSettings();
                  // Wait for the user to return from settings
                  await Future.delayed(Duration(seconds: 2));
                  status = await Permission.location.status;
                  if (status.isGranted) {
                    Navigator.of(context).pop(); // Close the dialog
                  }
                },
                child: Text(
                  'Open Settings',
                  style: TextStyle(color: Color(0xFFFAFAFA)),
                ),
              ),
            ],
          ),
        );
      },
    );
    status = await Permission.location.status;
  }

  return true;
}
