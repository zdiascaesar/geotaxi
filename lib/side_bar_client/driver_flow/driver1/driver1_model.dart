import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'driver1_widget.dart' show Driver1Widget;
import 'package:flutter/material.dart';

class Driver1Model extends FlutterFlowModel<Driver1Widget> {
  ///  Local state fields for this page.

  int? freeRides = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Driver1 widget.
  List<RidesRecord>? foundRides;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
