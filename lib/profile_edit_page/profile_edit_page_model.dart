import '/flutter_flow/flutter_flow_util.dart';
import 'profile_edit_page_widget.dart' show ProfileEditPageWidget;
import 'package:flutter/material.dart';

class ProfileEditPageModel extends FlutterFlowModel<ProfileEditPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();
  }
}
