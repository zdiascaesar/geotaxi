import '/flutter_flow/flutter_flow_util.dart';
import 'registration_three_page_widget.dart' show RegistrationThreePageWidget;
import 'package:flutter/material.dart';

class RegistrationThreePageModel
    extends FlutterFlowModel<RegistrationThreePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for modelCar widget.
  FocusNode? modelCarFocusNode;
  TextEditingController? modelCarTextController;
  String? Function(BuildContext, String?)? modelCarTextControllerValidator;
  String? _modelCarTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p31t3nkr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for typeCar widget.
  FocusNode? typeCarFocusNode;
  TextEditingController? typeCarTextController;
  String? Function(BuildContext, String?)? typeCarTextControllerValidator;
  String? _typeCarTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lgd5pkda' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for numberCar widget.
  FocusNode? numberCarFocusNode;
  TextEditingController? numberCarTextController;
  String? Function(BuildContext, String?)? numberCarTextControllerValidator;
  String? _numberCarTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'an435hgu' /* Field is required */,
      );
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    modelCarTextControllerValidator = _modelCarTextControllerValidator;
    typeCarTextControllerValidator = _typeCarTextControllerValidator;
    numberCarTextControllerValidator = _numberCarTextControllerValidator;
  }

  @override
  void dispose() {
    modelCarFocusNode?.dispose();
    modelCarTextController?.dispose();

    typeCarFocusNode?.dispose();
    typeCarTextController?.dispose();

    numberCarFocusNode?.dispose();
    numberCarTextController?.dispose();
  }
}
