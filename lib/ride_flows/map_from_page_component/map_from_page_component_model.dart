import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'map_from_page_component_widget.dart' show MapFromPageComponentWidget;
import 'package:flutter/material.dart';

class MapFromPageComponentModel
    extends FlutterFlowModel<MapFromPageComponentWidget> {
  ///  Local state fields for this component.

  bool? locationPermission;

  LatLng? currentDeviceLocation;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - chekLocationCopy] action in MapFromPageComponent widget.
  bool? copy;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - getAddressFromLatLng] action in Button widget.
  String? getAddress;
  // Stores action output result for [Custom Action - chekLocation] action in IconButton widget.
  bool? location;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
