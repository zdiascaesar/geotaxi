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

Future checkRideStatus(
  DocumentReference rideDoc,
  int targetStatus,
  Future Function() actionToPerform,
) async {
  rideDoc.snapshots().listen((DocumentSnapshot docSnapshot) {
    if (docSnapshot.exists) {
      // Приводим данные к Map<String, dynamic>
      final data = docSnapshot.data() as Map<String, dynamic>?;

      // Получаем значение поля status
      int status = data?['status'] ?? 0;

      // Если статус равен targetStatus (например, 9), выполняем actionToPerform
      if (status == targetStatus) {
        actionToPerform();
      }
    }
  });
}
