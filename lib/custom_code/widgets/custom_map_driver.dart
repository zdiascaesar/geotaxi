// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:latlong2/latlong.dart' as latlong2;
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:math' show pi, cos, sin, pow;

class CustomMapDriver extends StatefulWidget {
  const CustomMapDriver({
    super.key,
    this.width,
    this.height,
    this.fromWhere,
    this.toWhere,
    required this.isStartFromDriver,
  });

  final double? width;
  final double? height;
  final LatLng? fromWhere;
  final LatLng? toWhere;
  final bool isStartFromDriver;

  @override
  State<CustomMapDriver> createState() => _CustomMapDriverState();
}

class _CustomMapDriverState extends State<CustomMapDriver> {
  List<latlong2.LatLng> routePoints = [];
  String eta = '';
  latlong2.LatLng? mapCenter;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  void _initializeMap() {
    if (widget.fromWhere != null) {
      mapCenter = latlong2.LatLng(
          widget.fromWhere!.latitude, widget.fromWhere!.longitude);
    } else if (widget.toWhere != null) {
      mapCenter =
          latlong2.LatLng(widget.toWhere!.latitude, widget.toWhere!.longitude);
    } else {
      // Установите значение по умолчанию, например, центр вашего города
      mapCenter = latlong2.LatLng(55.7558, 37.6173); // Москва
    }
    _fetchRoute();
  }

  Future<void> _fetchRoute() async {
    if (widget.fromWhere == null || widget.toWhere == null) {
      print('Start or end location is not set');
      return;
    }

    const accessToken =
        'pk.eyJ1IjoiNmVremhhbiIsImEiOiJjbHppM214dWswYjB1MmtzNDRsdno4ZmFxIn0.LVh6MJeD2z0AViZebxN1-A';

    final start = latlong2.LatLng(
        widget.fromWhere!.latitude, widget.fromWhere!.longitude);
    final end =
        latlong2.LatLng(widget.toWhere!.latitude, widget.toWhere!.longitude);

    final url = Uri.parse(
        'https://api.mapbox.com/directions/v5/mapbox/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?geometries=geojson&access_token=$accessToken');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data != null &&
            data['routes'] != null &&
            data['routes'].isNotEmpty) {
          final coordinates =
              data['routes'][0]['geometry']['coordinates'] as List;
          final durationSeconds = data['routes'][0]['duration'];
          final rawPoints = coordinates
              .map((coord) => latlong2.LatLng(coord[1], coord[0]))
              .toList();
          setState(() {
            routePoints = _smoothPath(rawPoints);
            eta = _formatDuration(durationSeconds);
          });
        } else {
          print('Route not found.');
        }
      } else {
        print('Error loading route: ${response.body}');
      }
    } catch (e) {
      print('Error fetching route: $e');
    }
  }

  List<latlong2.LatLng> _smoothPath(List<latlong2.LatLng> points) {
    if (points.length <= 2) return points;

    List<latlong2.LatLng> smoothedPoints = [];
    for (int i = 0; i < points.length - 1; i++) {
      latlong2.LatLng p0 = i > 0 ? points[i - 1] : points[i];
      latlong2.LatLng p1 = points[i];
      latlong2.LatLng p2 = points[i + 1];
      latlong2.LatLng p3 = (i < points.length - 2) ? points[i + 2] : p2;

      for (int j = 0; j < 10; j++) {
        double t = j / 10;
        double tt = t * t;
        double ttt = tt * t;

        double q1 = -ttt + 2.0 * tt - t;
        double q2 = 3.0 * ttt - 5.0 * tt + 2.0;
        double q3 = -3.0 * ttt + 4.0 * tt + t;
        double q4 = ttt - tt;

        double tx = 0.5 *
            (p0.longitude * q1 +
                p1.longitude * q2 +
                p2.longitude * q3 +
                p3.longitude * q4);
        double ty = 0.5 *
            (p0.latitude * q1 +
                p1.latitude * q2 +
                p2.latitude * q3 +
                p3.latitude * q4);

        smoothedPoints.add(latlong2.LatLng(ty, tx));
      }
    }

    smoothedPoints.add(points.last);
    return smoothedPoints;
  }

  String _formatDuration(double seconds) {
    final minutes = (seconds / 60).round();
    if (minutes < 60) {
      return '$minutes мин';
    } else {
      final hours = minutes ~/ 60;
      final remainingMinutes = minutes % 60;
      return '$hours ч $remainingMinutes мин';
    }
  }

  @override
  Widget build(BuildContext context) {
    final startLocation = widget.fromWhere != null
        ? latlong2.LatLng(
            widget.fromWhere!.latitude, widget.fromWhere!.longitude)
        : null;
    final endLocation = widget.toWhere != null
        ? latlong2.LatLng(widget.toWhere!.latitude, widget.toWhere!.longitude)
        : null;

    final startIcon = widget.isStartFromDriver
        ? Image.asset(
            'assets/images/car_top.png',
            width: 24,
            height: 48,
          )
        : Image.asset(
            'assets/images/ic_dest.png',
            width: 40.0,
            height: 40.0,
          );

    final endIcon = Image.asset(
      'assets/images/ic_dest.png',
      width: 40.0,
      height: 40.0,
    );

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: mapCenter ?? latlong2.LatLng(0, 0),
              initialZoom: 13.0,
              minZoom: 5,
              maxZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/mapbox/light-v11/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiNmVremhhbiIsImEiOiJjbHppM214dWswYjB1MmtzNDRsdno4ZmFxIn0.LVh6MJeD2z0AViZebxN1-A",
                subdomains: const ['a', 'b', 'c'],
              ),
              if (routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: routePoints,
                      strokeWidth: 5.0,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  if (startLocation != null)
                    Marker(
                      point: startLocation,
                      child: startIcon,
                    ),
                  if (endLocation != null)
                    Marker(
                      point: endLocation,
                      child: Column(
                        children: [
                          if (eta.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Text(
                                eta,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          endIcon,
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
