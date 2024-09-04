import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/side_bar_client/side_bar/side_bar_widget.dart';
import 'client3_widget.dart' show Client3Widget;
import 'package:flutter/material.dart';

class Client3Model extends FlutterFlowModel<Client3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  RidesRecord? client3PreviousSnapshot;
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
