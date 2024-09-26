import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/side_bar_client/side_bar/side_bar_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int? page = 0;

  bool? carFound = false;

  String? destinationA;

  String? destinationB;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - chekLocationPermission] action in HomePage widget.
  bool? locationIsTrue;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  RidesRecord? ongoingRide;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  RidesRecord? ongoingRideClient;
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
