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
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({
    super.key,
    this.width,
    this.height,
    required this.currentDeviceLocation,
    this.fromWhere,
    this.toWhere,
  });

  final double? width;
  final double? height;
  final LatLng currentDeviceLocation;
  final LatLng? fromWhere;
  final LatLng? toWhere;

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  late latlong2.LatLng mapCenter;
  latlong2.LatLng? userLocation;
  List<latlong2.LatLng> routePoints = [];
  latlong2.LatLng? fromLocation;
  latlong2.LatLng? toLocation;
  final MapController mapController = MapController();

  final latlong2.LatLng defaultLocation =
      latlong2.LatLng(55.755826, 37.6172999);

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    await _checkLocationPermission();
    _updateUserLocation();
    _updateFromToLocations();
    updateLocations();
  }

  Future<void> _checkLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
      if (!await Permission.location.isGranted) {
        await openAppSettings();
      }
    }
  }

  void _updateUserLocation() {
    setState(() {
      if (widget.currentDeviceLocation.latitude != 0 &&
          widget.currentDeviceLocation.longitude != 0) {
        userLocation = latlong2.LatLng(
          widget.currentDeviceLocation.latitude,
          widget.currentDeviceLocation.longitude,
        );
        mapCenter = userLocation!;
      } else {
        userLocation = null;
        mapCenter = defaultLocation;
      }
    });
  }

  void _updateFromToLocations() {
    fromLocation = widget.fromWhere != null
        ? latlong2.LatLng(
            widget.fromWhere!.latitude, widget.fromWhere!.longitude)
        : null;
    toLocation = widget.toWhere != null
        ? latlong2.LatLng(widget.toWhere!.latitude, widget.toWhere!.longitude)
        : null;
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
        'https://api.mapbox.com/directions/v5/mapbox/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?geometries=geojson&overview=full&access_token=$accessToken');

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
              routePoints = rawPoints;
            });
          }
        }
      }
    } catch (e) {
      print('Error fetching route: $e');
    }
  }

  void _centerOnCurrentLocation() {
    if (userLocation != null) {
      mapController.move(userLocation!, 13.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: mapCenter,
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
                      color: Colors.blue,
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  if (userLocation != null)
                    Marker(
                      width: 40,
                      height: 40,
                      point: userLocation!,
                      child: Icon(Icons.location_pin,
                          color: Colors.blue), // Replace 'builder' with 'child'
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 16,
            top: 16,
            child: FloatingActionButton(
              onPressed: _centerOnCurrentLocation,
              child: Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}
