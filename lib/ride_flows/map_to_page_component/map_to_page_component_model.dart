import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'map_to_page_component_widget.dart' show MapToPageComponentWidget;
import 'package:flutter/material.dart';

class MapToPageComponentModel
    extends FlutterFlowModel<MapToPageComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - getAddressFromLatLng] action in Button widget.
  String? getAddress;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
