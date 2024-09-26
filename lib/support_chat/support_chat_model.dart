import '/flutter_flow/flutter_flow_util.dart';
import 'support_chat_widget.dart' show SupportChatWidget;
import 'package:flutter/material.dart';

class SupportChatModel extends FlutterFlowModel<SupportChatWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
