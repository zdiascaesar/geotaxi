import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ride_flows/components/single_history_ride/single_history_ride_widget.dart';
import 'history_detail_page_widget.dart' show HistoryDetailPageWidget;
import 'package:flutter/material.dart';

class HistoryDetailPageModel extends FlutterFlowModel<HistoryDetailPageWidget> {
  ///  Local state fields for this page.

  List<LatLng> latlng = [];
  void addToLatlng(LatLng item) => latlng.add(item);
  void removeFromLatlng(LatLng item) => latlng.remove(item);
  void removeAtIndexFromLatlng(int index) => latlng.removeAt(index);
  void insertAtIndexInLatlng(int index, LatLng item) =>
      latlng.insert(index, item);
  void updateLatlngAtIndex(int index, Function(LatLng) updateFn) =>
      latlng[index] = updateFn(latlng[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for SingleHistoryRide component.
  late SingleHistoryRideModel singleHistoryRideModel;

  @override
  void initState(BuildContext context) {
    singleHistoryRideModel =
        createModel(context, () => SingleHistoryRideModel());
  }

  @override
  void dispose() {
    singleHistoryRideModel.dispose();
  }
}
