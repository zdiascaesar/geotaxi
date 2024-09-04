import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'client8_model.dart';
export 'client8_model.dart';

class Client8Widget extends StatefulWidget {
  const Client8Widget({
    super.key,
    required this.ride,
    required this.driver,
  });

  final DocumentReference? ride;
  final DocumentReference? driver;

  @override
  State<Client8Widget> createState() => _Client8WidgetState();
}

class _Client8WidgetState extends State<Client8Widget> {
  late Client8Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Client8Model());
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: const Icon(
              FFIcons.kchevronbackward,
              color: Color(0xFF1C1C1E),
              size: 24.0,
            ),
            onPressed: () async {
              context.goNamed(
                'Client2',
                queryParameters: {
                  'findingDriver': serializeParam(
                    widget.ride,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
              );
            },
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.5,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 40.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '5lsxmev6' /* Пожалуйста, выберите
причину о... */
                    ,
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.checkedIssue = 'Попал в аварию';
                        setState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 14.0,
                            height: 14.0,
                            decoration: BoxDecoration(
                              color: _model.checkedIssue == 'Попал в аварию'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _model.checkedIssue == 'Попал в аварию'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                              ),
                            ),
                            child: const Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 6.0,
                              ),
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'ln7nbyjh' /* Попал в аварию */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: _model.checkedIssue == 'Попал в аварию'
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(const SizedBox(width: 14.0)),
                      ),
                    ),
                    const Divider(
                      height: 40.0,
                      thickness: 1.0,
                      color: Color(0xCCEBEBEB),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.checkedIssue = 'Не могу связаться с водителем';
                        setState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 14.0,
                            height: 14.0,
                            decoration: BoxDecoration(
                              color: _model.checkedIssue ==
                                      'Не могу связаться с водителем'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _model.checkedIssue ==
                                        'Не могу связаться с водителем'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                              ),
                            ),
                            child: const Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 6.0,
                              ),
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'f95fqbvq' /* Не могу связаться с водителем */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: _model.checkedIssue ==
                                          'Не могу связаться с водителем'
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(const SizedBox(width: 14.0)),
                      ),
                    ),
                    const Divider(
                      height: 40.0,
                      thickness: 1.0,
                      color: Color(0xCCEBEBEB),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.checkedIssue = 'Водитель опаздывает';
                        setState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 14.0,
                            height: 14.0,
                            decoration: BoxDecoration(
                              color:
                                  _model.checkedIssue == 'Водитель опаздывает'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    _model.checkedIssue == 'Водитель опаздывает'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                              ),
                            ),
                            child: const Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 6.0,
                              ),
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '4gle58td' /* Водитель опаздывает */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: _model.checkedIssue ==
                                          'Водитель опаздывает'
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(const SizedBox(width: 14.0)),
                      ),
                    ),
                    const Divider(
                      height: 40.0,
                      thickness: 1.0,
                      color: Color(0xCCEBEBEB),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.checkedIssue = 'Цена не является разумной';
                        setState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 14.0,
                            height: 14.0,
                            decoration: BoxDecoration(
                              color: _model.checkedIssue ==
                                      'Цена не является разумной'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _model.checkedIssue ==
                                        'Цена не является разумной'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                              ),
                            ),
                            child: const Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 6.0,
                              ),
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'pgvsh8q4' /* Цена не является разумной */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: _model.checkedIssue ==
                                          'Цена не является разумной'
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(const SizedBox(width: 14.0)),
                      ),
                    ),
                    const Divider(
                      height: 40.0,
                      thickness: 1.0,
                      color: Color(0xCCEBEBEB),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.checkedIssue = 'Неверный адрес поездки';
                        setState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 14.0,
                            height: 14.0,
                            decoration: BoxDecoration(
                              color: _model.checkedIssue ==
                                      'Неверный адрес поездки'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _model.checkedIssue ==
                                        'Неверный адрес поездки'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                              ),
                            ),
                            child: const Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 6.0,
                              ),
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'ivag97eg' /* Неверный адрес поездки */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: _model.checkedIssue ==
                                          'Неверный адрес поездки'
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(const SizedBox(width: 14.0)),
                      ),
                    ),
                    const Divider(
                      height: 40.0,
                      thickness: 1.0,
                      color: Color(0xCCEBEBEB),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: FFButtonWidget(
                  onPressed:
                      (_model.checkedIssue == null || _model.checkedIssue == '')
                          ? null
                          : () async {
                              unawaited(
                                () async {
                                  await RideCancelsRecord.collection
                                      .doc()
                                      .set(createRideCancelsRecordData(
                                        rideId: widget.ride?.id,
                                        driver: widget.driver,
                                        createdBy: currentUserReference,
                                        createdAt: getCurrentTimestamp,
                                        problem: _model.checkedIssue,
                                      ));
                                }(),
                              );

                              await widget.ride!.update(createRidesRecordData(
                                status: 9,
                                cancelled: true,
                              ));
                              unawaited(
                                () async {
                                  await ChatRecord.createDoc(widget.ride!)
                                      .set(createChatRecordData(
                                    message: 'Cancel ride',
                                    messagedAt: getCurrentTimestamp,
                                    messageBy: currentUserReference,
                                  ));
                                }(),
                              );
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Заявка создана'),
                                    content: Text(_model.checkedIssue!),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );

                              context.goNamed('HomePage');
                            },
                  text: FFLocalizations.of(context).getText(
                    'igk6x3b1' /* Отправить */,
                  ),
                  options: FFButtonOptions(
                    height: 42.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                    disabledColor: const Color(0xFFCCCCCC),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
