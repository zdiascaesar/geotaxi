import '/flutter_flow/flutter_flow_util.dart';
import 'registration_three_page_widget.dart' show RegistrationThreePageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationThreePageModel
    extends FlutterFlowModel<RegistrationThreePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for typeCar widget.
  FocusNode? typeCarFocusNode;
  TextEditingController? typeCarTextController;
  String? Function(BuildContext, String?)? typeCarTextControllerValidator;
  String? _typeCarTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lgd5pkda' /* Обязательное поле */,
      );
    }

    return null;
  }

  // State field(s) for modelCar widget.
  FocusNode? modelCarFocusNode;
  TextEditingController? modelCarTextController;
  String? Function(BuildContext, String?)? modelCarTextControllerValidator;
  String? _modelCarTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p31t3nkr' /* Обязательное поле */,
      );
    }

    return null;
  }

  // State field(s) for yearCar widget.
  FocusNode? yearCarFocusNode;
  TextEditingController? yearCarTextController;
  final yearCarMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? yearCarTextControllerValidator;
  // State field(s) for numberCar widget.
  FocusNode? numberCarFocusNode;
  TextEditingController? numberCarTextController;
  String? Function(BuildContext, String?)? numberCarTextControllerValidator;
  String? _numberCarTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'an435hgu' /* Обязательное поле */,
      );
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidated;

  @override
  void initState(BuildContext context) {
    typeCarTextControllerValidator = _typeCarTextControllerValidator;
    modelCarTextControllerValidator = _modelCarTextControllerValidator;
    numberCarTextControllerValidator = _numberCarTextControllerValidator;
  }

  @override
  void dispose() {
    typeCarFocusNode?.dispose();
    typeCarTextController?.dispose();

    modelCarFocusNode?.dispose();
    modelCarTextController?.dispose();

    yearCarFocusNode?.dispose();
    yearCarTextController?.dispose();

    numberCarFocusNode?.dispose();
    numberCarTextController?.dispose();
  }
}
