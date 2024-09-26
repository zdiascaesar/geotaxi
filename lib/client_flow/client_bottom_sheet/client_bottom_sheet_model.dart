import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_bottom_sheet_widget.dart' show ClientBottomSheetWidget;
import 'package:flutter/material.dart';

class ClientBottomSheetModel extends FlutterFlowModel<ClientBottomSheetWidget> {
  ///  Local state fields for this component.

  bool? showSideBar = false;

  dynamic fromWherejson;

  dynamic toWherejson;

  bool? check;

  int? amount = 0;

  bool? isHiddenFrom;

  bool? isHiddenTo;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4ir99ck1' /* Обязательное поле */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Places Google API)] action in TextField widget.
  ApiCallResponse? fromWhere2;
  // Stores action output result for [Custom Action - chekLocation] action in Text widget.
  bool? location;
  // Stores action output result for [Bottom Sheet - MapFromPageComponent] action in Text widget.
  String? getFromAddress;
  // Stores action output result for [Backend Call - API (Google API)] action in Row widget.
  ApiCallResponse? fromWhere;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kc7a9mog' /* Обязательное поле */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Places Google API)] action in TextField widget.
  ApiCallResponse? toWhere2;
  // Stores action output result for [Bottom Sheet - MapToPageComponent] action in Text widget.
  String? getToAddress;
  // Stores action output result for [Backend Call - API (Google API)] action in Row widget.
  ApiCallResponse? toWhere;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? foundUsers;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RidesRecord? newOrderRide;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
