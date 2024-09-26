import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'driver1_widget.dart' show Driver1Widget;
import 'package:flutter/material.dart';

class Driver1Model extends FlutterFlowModel<Driver1Widget> {
  ///  Local state fields for this page.

  int? freeRides = 0;

  List<String> dismissedRides = [];
  void addToDismissedRides(String item) => dismissedRides.add(item);
  void removeFromDismissedRides(String item) => dismissedRides.remove(item);
  void removeAtIndexFromDismissedRides(int index) =>
      dismissedRides.removeAt(index);
  void insertAtIndexInDismissedRides(int index, String item) =>
      dismissedRides.insert(index, item);
  void updateDismissedRidesAtIndex(int index, Function(String) updateFn) =>
      dismissedRides[index] = updateFn(dismissedRides[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Driver1 widget.
  List<RidesRecord>? foundRides;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
