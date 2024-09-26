import '/flutter_flow/flutter_flow_util.dart';
import '/side_bar_client/side_bar/side_bar_widget.dart';
import 'driver4_widget.dart' show Driver4Widget;
import 'package:flutter/material.dart';

class Driver4Model extends FlutterFlowModel<Driver4Widget> {
  ///  State fields for stateful widgets in this page.

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
