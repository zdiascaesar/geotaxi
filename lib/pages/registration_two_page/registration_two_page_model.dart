import '/flutter_flow/flutter_flow_util.dart';
import 'registration_two_page_widget.dart' show RegistrationTwoPageWidget;
import 'package:flutter/material.dart';

class RegistrationTwoPageModel
    extends FlutterFlowModel<RegistrationTwoPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for firstname widget.
  FocusNode? firstnameFocusNode;
  TextEditingController? firstnameTextController;
  String? Function(BuildContext, String?)? firstnameTextControllerValidator;
  String? _firstnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mxm0r9bd' /* Обязательное поле */,
      );
    }

    return null;
  }

  // State field(s) for secondname widget.
  FocusNode? secondnameFocusNode;
  TextEditingController? secondnameTextController;
  String? Function(BuildContext, String?)? secondnameTextControllerValidator;
  String? _secondnameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9kxxd43c' /* Обязательное поле */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r9ie9q5s' /* Обязательное поле */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidated;

  @override
  void initState(BuildContext context) {
    firstnameTextControllerValidator = _firstnameTextControllerValidator;
    secondnameTextControllerValidator = _secondnameTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
  }

  @override
  void dispose() {
    firstnameFocusNode?.dispose();
    firstnameTextController?.dispose();

    secondnameFocusNode?.dispose();
    secondnameTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
