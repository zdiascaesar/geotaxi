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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> userStatus() async {
  // Setup the app lifecycle observer
  WidgetsBinding.instance.addObserver(_AppLifecycleObserver());
  // Return true to indicate successful setup
  return true;
}

class _AppLifecycleObserver with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    if (state == AppLifecycleState.detached) {
      // App is closed
      _updateReadyToWork(userRef, false);
    }
  }

  void _updateReadyToWork(DocumentReference ref, bool readyToWork) {
    ref.update({'ready_to_work': readyToWork}).catchError((error) {
      print('Error updating ready_to_work: $error');
    });
  }
}

// Function to be called when user logs out
Future<void> userLogout() async {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId != null) {
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await _updateReadyToWorkOnLogout(userRef);
  }
  // Perform actual logout
  await FirebaseAuth.instance.signOut();
}

Future<void> _updateReadyToWorkOnLogout(DocumentReference ref) async {
  await ref.update({'ready_to_work': false}).catchError((error) {
    print('Error updating ready_to_work on logout: $error');
  });
}
