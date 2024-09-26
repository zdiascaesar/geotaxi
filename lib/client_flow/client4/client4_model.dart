import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/side_bar_client/side_bar/side_bar_widget.dart';
import 'client4_widget.dart' show Client4Widget;
import 'package:flutter/material.dart';

class Client4Model extends FlutterFlowModel<Client4Widget> {
  ///  Local state fields for this page.

  bool? next;

  ///  State fields for stateful widgets in this page.

  RidesRecord? client4PreviousSnapshot;
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
