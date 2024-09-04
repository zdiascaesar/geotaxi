import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
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

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.maybeDispose();

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

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          FlutterFlowGoogleMap(
            controller: _model.googleMapsController,
            onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
            initialLocation: _model.googleMapsCenter ??=
                currentUserLocationValue!,
            markerColor: GoogleMarkerColor.violet,
            mapType: MapType.normal,
            style: GoogleMapStyle.silver,
            initialZoom: 14.0,
            allowInteraction: true,
            allowZoom: true,
            showZoomControls: true,
            showLocation: true,
            showCompass: false,
            showMapToolbar: false,
            showTraffic: false,
            centerMapOnMarkerTap: true,
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: PointerInterceptor(
              intercepting: isWeb,
              child: Image.asset(
                'assets/images/ic_dest.png',
                width: 36.0,
                height: 36.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: PointerInterceptor(
              intercepting: isWeb,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    FFAppState().fromWhere = _model.googleMapsCenter;
                    setState(() {});
                    _model.getAddress = await actions.getAddressFromLatLng(
                      _model.googleMapsCenter!,
                    );
                    Navigator.pop(context, _model.getAddress);

                    setState(() {});
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, -1.0),
            child: PointerInterceptor(
              intercepting: isWeb,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 25.0, 0.0),
                child: FlutterFlowIconButton(
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
            ),
          ),
        ],
      ),
    );
  }
}
