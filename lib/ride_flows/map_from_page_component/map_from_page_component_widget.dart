import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'map_from_page_component_model.dart';
export 'map_from_page_component_model.dart';

class MapFromPageComponentWidget extends StatefulWidget {
  const MapFromPageComponentWidget({super.key});

  @override
  State<MapFromPageComponentWidget> createState() =>
      _MapFromPageComponentWidgetState();
}

class _MapFromPageComponentWidgetState
    extends State<MapFromPageComponentWidget> {
  late MapFromPageComponentModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapFromPageComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      _model.copy = await actions.chekLocationCopy(
        context,
      );
      if (_model.copy!) {
        _model.currentDeviceLocation = currentUserLocationValue;
        _model.updatePage(() {});
      } else {
        _model.currentDeviceLocation = FFAppState().initialMap;
        _model.updatePage(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: FlutterFlowGoogleMap(
              controller: _model.googleMapsController,
              onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
              initialLocation: _model.googleMapsCenter ??=
                  FFAppState().currentDeviceLocation!,
              markerColor: GoogleMarkerColor.violet,
              mapType: MapType.normal,
              style: GoogleMapStyle.silver,
              initialZoom: 14.0,
              allowInteraction: true,
              allowZoom: true,
              showZoomControls: true,
              showLocation: false,
              showCompass: false,
              showMapToolbar: false,
              showTraffic: false,
              centerMapOnMarkerTap: true,
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Image.asset(
              'assets/images/ic_dest.png',
              width: 36.0,
              height: 36.0,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
              child: FFButtonWidget(
                onPressed: () async {
                  _model.getAddress = await actions.getAddressFromLatLng(
                    _model.googleMapsCenter!,
                  );
                  Navigator.pop(context, _model.getAddress);
                  FFAppState().fromWhere = _model.googleMapsCenter;
                  _model.updatePage(() {});

                  safeSetState(() {});
                },
                text: FFLocalizations.of(context).getText(
                  'u18t9xgi' /* Отметить на карте */,
                ),
                icon: const Icon(
                  FFIcons.kmappinandellipse,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-0.8, -0.8),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: Colors.black,
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.8, -0.8),
            child: FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 48.0,
              fillColor: FlutterFlowTheme.of(context).primary,
              icon: FaIcon(
                FontAwesomeIcons.locationArrow,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              onPressed: () async {
                currentUserLocationValue = await getCurrentUserLocation(
                    defaultLocation: const LatLng(0.0, 0.0));
                _model.location = await actions.chekLocation(
                  context,
                );
                if (_model.location!) {
                  await _model.googleMapsController.future.then(
                    (c) => c.animateCamera(
                      CameraUpdate.newLatLng(
                          currentUserLocationValue!.toGoogleMaps()),
                    ),
                  );
                }

                safeSetState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
