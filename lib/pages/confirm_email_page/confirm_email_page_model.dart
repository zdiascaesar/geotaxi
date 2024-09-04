import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirm_email_page_widget.dart' show ConfirmEmailPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class ConfirmEmailPageModel extends FlutterFlowModel<ConfirmEmailPageWidget> {
  ///  Local state fields for this page.

  List<int> pinCode = [];
  void addToPinCode(int item) => pinCode.add(item);
  void removeFromPinCode(int item) => pinCode.remove(item);
  void removeAtIndexFromPinCode(int index) => pinCode.removeAt(index);
  void insertAtIndexInPinCode(int index, int item) =>
      pinCode.insert(index, item);
  void updatePinCodeAtIndex(int index, Function(int) updateFn) =>
      pinCode[index] = updateFn(pinCode[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 30000;
  int timerMilliseconds = 30000;
  String timerValue = StopWatchTimer.getDisplayTime(
    30000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    timerController.dispose();
  }

  /// Action blocks.
  Future pinCodeEnter(
    BuildContext context, {
    int? number,
  }) async {}
}
