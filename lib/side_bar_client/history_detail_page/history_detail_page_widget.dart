import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ride_flows/components/single_history_ride/single_history_ride_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'history_detail_page_model.dart';
export 'history_detail_page_model.dart';

class HistoryDetailPageWidget extends StatefulWidget {
  const HistoryDetailPageWidget({
    super.key,
    required this.ride,
  });

  final RidesRecord? ride;

  @override
  State<HistoryDetailPageWidget> createState() =>
      _HistoryDetailPageWidgetState();
}

class _HistoryDetailPageWidgetState extends State<HistoryDetailPageWidget> {
  late HistoryDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.addToLatlng(widget.ride!.fromLocation!);
          setState(() {});
        }),
        Future(() async {
          _model.addToLatlng(widget.ride!.toLocation!);
          setState(() {});
        }),
      ]);
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: const Icon(
              FFIcons.kchevronbackward,
              color: Color(0xFF1C1C1E),
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '859iqv74' /* История поездки */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: const Color(0xFF1C1C1E),
                  fontSize: 19.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.5,
        ),
        body: Stack(
          children: [
            FlutterFlowGoogleMap(
              controller: _model.googleMapsController,
              onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
              initialLocation: _model.googleMapsCenter ??= _model.latlng.first,
              markers: _model.latlng
                  .map(
                    (marker) => FlutterFlowMarker(
                      marker.serialize(),
                      marker,
                    ),
                  )
                  .toList(),
              markerColor: GoogleMarkerColor.violet,
              mapType: MapType.normal,
              style: GoogleMapStyle.silver,
              initialZoom: 14.0,
              allowInteraction: false,
              allowZoom: false,
              showZoomControls: false,
              showLocation: false,
              showCompass: false,
              showMapToolbar: false,
              showTraffic: false,
              centerMapOnMarkerTap: false,
            ),
            PointerInterceptor(
              intercepting: isWeb,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  wrapWithModel(
                    model: _model.singleHistoryRideModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: SingleHistoryRideWidget(
                      ride: widget.ride!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
