import '/flutter_flow/flutter_flow_util.dart';
import 'registration_two_page_widget.dart' show RegistrationTwoPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationTwoPageModel
    extends FlutterFlowModel<RegistrationTwoPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for firstname widget.
  FocusNode? firstnameFocusNode;
  TextEditingController? firstnameTextController;
  String? Function(BuildContext, String?)? firstnameTextControllerValidator;
  String? _firstnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'psrxjv68' /* Field is required */,
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
        'n3wlgvro' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  final phoneNumberMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'enltalc2' /* Field is required */,
      );
    }

    return null;
  }

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
