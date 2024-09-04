import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/side_bar_client/side_bar/side_bar_widget.dart';
import 'driver3_widget.dart' show Driver3Widget;
import 'package:flutter/material.dart';

class Driver3Model extends FlutterFlowModel<Driver3Widget> {
  ///  Local state fields for this page.

  bool? awaiting = false;

  bool rideIsCancelled = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  RidesRecord? driver3PreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in Driver3 widget.
  RidesRecord? cancelledRide;
  // Model for SideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    sideBarModel.dispose();
  }
}
