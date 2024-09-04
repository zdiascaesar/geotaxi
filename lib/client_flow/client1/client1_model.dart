import '/flutter_flow/flutter_flow_util.dart';
import '/side_bar_client/side_bar/side_bar_widget.dart';
import 'client1_widget.dart' show Client1Widget;
import 'package:flutter/material.dart';

class Client1Model extends FlutterFlowModel<Client1Widget> {
  ///  Local state fields for this page.

  List<LatLng> lats = [];
  void addToLats(LatLng item) => lats.add(item);
  void removeFromLats(LatLng item) => lats.remove(item);
  void removeAtIndexFromLats(int index) => lats.removeAt(index);
  void insertAtIndexInLats(int index, LatLng item) => lats.insert(index, item);
  void updateLatsAtIndex(int index, Function(LatLng) updateFn) =>
      lats[index] = updateFn(lats[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
