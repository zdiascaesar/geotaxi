import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

LatLng? newCustomFunction(
  String? lat,
  String? lng,
) {
  // strings lat and lng to LatLng
  if (lat == null || lng == null) {
    return null;
  }
  final latitude = double.tryParse(lat);
  final longitude = double.tryParse(lng);
  if (latitude == null || longitude == null) {
    return null;
  }
  return LatLng(latitude, longitude);
}

String? convertListintegerToString(List<int>? integerList) {
  // Convert from List of Integers to String
  if (integerList == null) {
    return null;
  }
  return integerList.join('');
}

LatLng convertToLatLng(dynamic coordinates) {
  if (coordinates is Map<String, dynamic>) {
    final lat = coordinates['lat'];
    final lng = coordinates['lng'];

    if (lat == null || lng == null) {
      throw ArgumentError('Invalid JSON: "lat" or "lng" not found.');
    }

    return LatLng(lat, lng);
  } else {
    throw ArgumentError(
        'Invalid argument: expected a Map<String, dynamic> containing location data.');
  }
}

double? avgRating(
  double? totalVotes,
  double? totalNumber,
) {
  // count avg of rating out of 5
  if (totalVotes == null || totalNumber == null || totalNumber == 0) {
    return null;
  }
  return (totalVotes / totalNumber) * 5;
}
