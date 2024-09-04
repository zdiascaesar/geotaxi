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

import 'package:cloud_firestore/cloud_firestore.dart';

Future deleteRidesDocuments(
  int status,
  DateTime? createdAt,
) async {
  // Delete documents from Rides collection that are more than 10 minutes old and have status 0

  // Get the current time
  DateTime now = DateTime.now();

  // Check if createdAt is not null
  if (createdAt == null) {
    print('Error: createdAt is null');
    return;
  }

  // Calculate the time difference between the current time and the created_at time
  Duration difference = now.difference(createdAt);

  // Check if the status is 0 and the time difference is more than 10 minutes
  if (status == 0 && difference.inMinutes > 10) {
    // Get a reference to the Rides collection
    CollectionReference ridesCollection =
        FirebaseFirestore.instance.collection('Rides');

    // Query the collection for documents that match the criteria
    QuerySnapshot querySnapshot = await ridesCollection
        .where('status', isEqualTo: 0)
        .where('created_at', isLessThan: now.subtract(Duration(minutes: 10)))
        .get();

    // Loop through the documents and delete them
    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }

    print('Deleted ${querySnapshot.docs.length} documents');
  }
}
