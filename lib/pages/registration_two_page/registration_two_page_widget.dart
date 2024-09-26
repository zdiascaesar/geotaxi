import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'registration_two_page_model.dart';
export 'registration_two_page_model.dart';

class RegistrationTwoPageWidget extends StatefulWidget {
  const RegistrationTwoPageWidget({
    super.key,
    required this.role,
  });

  final int? role;

  @override
  State<RegistrationTwoPageWidget> createState() =>
      _RegistrationTwoPageWidgetState();
}

class _RegistrationTwoPageWidgetState extends State<RegistrationTwoPageWidget> {
  late RegistrationTwoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrationTwoPageModel());

    _model.firstnameTextController ??= TextEditingController();
    _model.firstnameFocusNode ??= FocusNode();

    _model.secondnameTextController ??= TextEditingController();
    _model.secondnameFocusNode ??= FocusNode();

    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'g3ntrkwq' /* Личные данные */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter',
                    color: const Color(0xFF1C1C1E),
                    fontSize: 19.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.5,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/image5.png',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 0.0, 20.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'z33rtv2z' /* Заполните личные данные */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextFormField(
                            controller: _model.firstnameTextController,
                            focusNode: _model.firstnameFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.firstnameTextController',
                              const Duration(milliseconds: 200),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            autofillHints: const [AutofillHints.givenName],
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '0sgzenzc' /* Имя */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x6614181B),
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFD5DDE0),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF7F8F9),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                ),
                            maxLength: 25,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            validator: _model.firstnameTextControllerValidator
                                .asValidator(context),
                          ),
                          TextFormField(
                            controller: _model.secondnameTextController,
                            focusNode: _model.secondnameFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.secondnameTextController',
                              const Duration(milliseconds: 200),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            autofillHints: const [AutofillHints.familyName],
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'ddp9cce5' /* Фамилия */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x6614181B),
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFD5DDE0),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF7F8F9),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                ),
                            maxLength: 25,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            validator: _model.secondnameTextControllerValidator
                                .asValidator(context),
                          ),
                          TextFormField(
                            controller: _model.phoneNumberTextController,
                            focusNode: _model.phoneNumberFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.phoneNumberTextController',
                              const Duration(milliseconds: 200),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            autofillHints: const [AutofillHints.telephoneNumber],
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'glh2afdm' /* Телефон */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x6614181B),
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFD5DDE0),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF7F8F9),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                ),
                            maxLength: 15,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.phone,
                            validator: _model.phoneNumberTextControllerValidator
                                .asValidator(context),
                          ),
                        ].divide(const SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: ((_model.firstnameTextController.text == '') ||
                              (_model.secondnameTextController.text == '') ||
                              (_model.phoneNumberTextController.text == ''))
                          ? null
                          : () async {
                              _model.formValidated = true;
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                safeSetState(
                                    () => _model.formValidated = false);
                                return;
                              }

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                displayName:
                                    _model.firstnameTextController.text,
                                photoUrl:
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/geo-taxi-zosi7j/assets/ugpw9l2ac2xr/am-a-19-year-old-multimedia-artist-student-from-manila--21.png',
                                phoneNumber:
                                    _model.phoneNumberTextController.text,
                                secondname:
                                    _model.secondnameTextController.text,
                                rating: 5.0,
                              ));
                              if (widget.role == 0) {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  fullRegistrationCompleted: true,
                                ));

                                context.goNamed('HomePage');
                              } else {
                                context.goNamed('RegistrationThreePage');
                              }

                              safeSetState(() {});
                            },
                      text: FFLocalizations.of(context).getText(
                        'gafjcivv' /* Далее */,
                      ),
                      options: FFButtonOptions(
                        height: 42.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        disabledColor: const Color(0xFFCD81D5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
