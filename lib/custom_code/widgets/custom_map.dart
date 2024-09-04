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

class CustomMap extends StatefulWidget {
  const CustomMap({
    super.key,
    this.width,
    this.height,
    required this.currentDeviceLocation,
    this.fromWhere,
    this.toWhere,
    required this.vehicleLocations,
  });

  final double? width;
  final double? height;
  final LatLng currentDeviceLocation;
  final LatLng? fromWhere;
  final LatLng? toWhere;
  final List<LatLng> vehicleLocations;

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late latlong2.LatLng userLocation;
  List<latlong2.LatLng> routePoints = [];
  latlong2.LatLng? fromLocation;
  latlong2.LatLng? toLocation;
  List<latlong2.LatLng> vehicleLocations = [];

  @override
  void initState() {
    super.initState();
    userLocation = latlong2.LatLng(
      widget.currentDeviceLocation.latitude,
      widget.currentDeviceLocation.longitude,
    );

    fromLocation = widget.fromWhere != null
        ? latlong2.LatLng(
            widget.fromWhere!.latitude, widget.fromWhere!.longitude)
        : null;
    toLocation = widget.toWhere != null
        ? latlong2.LatLng(widget.toWhere!.latitude, widget.toWhere!.longitude)
        : null;

    vehicleLocations = widget.vehicleLocations
        .map((location) =>
            latlong2.LatLng(location.latitude, location.longitude))
        .toList();

    updateLocations();
  }

  @override
  void didUpdateWidget(covariant CustomMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.fromWhere != oldWidget.fromWhere ||
        widget.toWhere != oldWidget.toWhere) {
      fromLocation = widget.fromWhere != null
          ? latlong2.LatLng(
              widget.fromWhere!.latitude, widget.fromWhere!.longitude)
          : null;
      toLocation = widget.toWhere != null
          ? latlong2.LatLng(widget.toWhere!.latitude, widget.toWhere!.longitude)
          : null;

      updateLocations();
    }
  }

  void updateLocations() {
    setState(() {
      if (fromLocation != null && toLocation != null) {
        _fetchRoute(fromLocation!, toLocation!);
      }
    });
  }

  Future<void> _fetchRoute(latlong2.LatLng start, latlong2.LatLng end) async {
    const accessToken =
        'pk.eyJ1IjoiNmVremhhbiIsImEiOiJjbHppM214dWswYjB1MmtzNDRsdno4ZmFxIn0.LVh6MJeD2z0AViZebxN1-A';
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

          if (coordinates.isNotEmpty) {
            List<latlong2.LatLng> rawPoints = coordinates
                .map((coord) => latlong2.LatLng(coord[1], coord[0]))
                .toList();

            setState(() {
              routePoints = _smoothPath(rawPoints);
            });
            print('Smooth route updated: ${routePoints.length} points');
          } else {
            print('Route contains no coordinates.');
          }
        } else {
          print('No route found.');
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

  @override
  Widget build(BuildContext context) {
    final endIcon = Image.asset(
      'assets/images/ic_dest.png',
      width: 40.0,
      height: 40.0,
    );

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: userLocation,
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
                    Marker(
                      width: 40,
                      height: 40,
                      point: userLocation,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(0.3),
                            ),
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(0.5),
                            ),
                          ),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.blue,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (fromLocation != null)
                      Marker(
                        width: 40,
                        height: 40,
                        point: fromLocation!,
                        child: endIcon,
                      ),
                    if (toLocation != null)
                      Marker(
                        width: 40,
                        height: 40,
                        point: toLocation!,
                        child: endIcon,
                      ),
                    ...vehicleLocations.map(
                      (vehicleLocation) => Marker(
                        width: 40,
                        height: 40,
                        point: vehicleLocation,
                        child: Image.asset(
                          'assets/images/car_top.png',
                          width: 24.0,
                          height: 48.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
