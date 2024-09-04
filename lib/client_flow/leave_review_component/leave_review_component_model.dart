import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'leave_review_component_widget.dart' show LeaveReviewComponentWidget;
import 'package:flutter/material.dart';

class LeaveReviewComponentModel
    extends FlutterFlowModel<LeaveReviewComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'urg37hap' /* Обязательное поле */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReviewsRecord? ratedDriver;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
