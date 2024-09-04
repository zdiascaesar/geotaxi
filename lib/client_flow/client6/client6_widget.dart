import '/backend/backend.dart';
import '/client_flow/leave_review_component/leave_review_component_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'client6_model.dart';
export 'client6_model.dart';

class Client6Widget extends StatefulWidget {
  const Client6Widget({
    super.key,
    required this.rideFinished,
  });

  final RidesRecord? rideFinished;

  @override
  State<Client6Widget> createState() => _Client6WidgetState();
}

class _Client6WidgetState extends State<Client6Widget> {
  late Client6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Client6Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: LeaveReviewComponentWidget(
                ride: widget.rideFinished!,
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 30.0,
            height: 30.0,
            child: SpinKitPulse(
              color: FlutterFlowTheme.of(context).primary,
              size: 30.0,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: FlutterFlowGoogleMap(
          controller: _model.googleMapsController,
          onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
          initialLocation: _model.googleMapsCenter ??=
              currentUserLocationValue!,
          markerColor: GoogleMarkerColor.violet,
          mapType: MapType.normal,
          style: GoogleMapStyle.silver,
          initialZoom: 14.0,
          allowInteraction: false,
          allowZoom: false,
          showZoomControls: true,
          showLocation: false,
          showCompass: false,
          showMapToolbar: false,
          showTraffic: false,
          centerMapOnMarkerTap: false,
        ),
      ),
    );
  }
}
