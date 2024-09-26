import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'confirm_email_page_model.dart';
export 'confirm_email_page_model.dart';

class ConfirmEmailPageWidget extends StatefulWidget {
  const ConfirmEmailPageWidget({
    super.key,
    required this.role,
  });

  final int? role;

  @override
  State<ConfirmEmailPageWidget> createState() => _ConfirmEmailPageWidgetState();
}

class _ConfirmEmailPageWidgetState extends State<ConfirmEmailPageWidget> {
  late ConfirmEmailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmEmailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'fl7f14f8' /* Код подтверждения */,
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
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'qugipkwl' /* На ваш e-mail был отправлен ко... */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 48.0,
                            letterSpacing: 48.0,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                      minLines: 1,
                      maxLength: 4,
                      buildCounter: (context,
                              {required currentLength,
                              required isFocused,
                              maxLength}) =>
                          null,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'ye93du14' /* Введите код  */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      FlutterFlowTimer(
                        initialTime: _model.timerInitialTimeMs,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
                          value,
                          hours: false,
                          milliSecond: false,
                        ),
                        controller: _model.timerController,
                        updateStateInterval: const Duration(milliseconds: 1000),
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) safeSetState(() {});
                        },
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(const SizedBox(width: 4.0)),
                  ),
                  const Spacer(),
                  if (_model.timerValue == '00000' ? true : false)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '3rg5i50x' /* Не получили код подтверждения?... */,
                              ),
                              style: const TextStyle(
                                color: Color(0x99000000),
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '34w03y72' /* Повторить */,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.5,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.pinCode.length == 4) {
                              return;
                            }

                            _model.addToPinCode(1);
                            safeSetState(() {});
                            safeSetState(() {
                              _model.textController?.text =
                                  functions.convertListintegerToString(
                                      _model.pinCode.toList())!;
                              _model.textController?.selection =
                                  const TextSelection.collapsed(offset: 0);
                            });
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'lqm1d1j1' /* 1 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.pinCode.length == 4) {
                              return;
                            }

                            _model.addToPinCode(2);
                            safeSetState(() {});
                            safeSetState(() {
                              _model.textController?.text =
                                  functions.convertListintegerToString(
                                      _model.pinCode.toList())!;
                              _model.textController?.selection =
                                  const TextSelection.collapsed(offset: 0);
                            });
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'nzedu6f5' /* 2 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.pinCode.length == 4) {
                              return;
                            }

                            _model.addToPinCode(3);
                            safeSetState(() {});
                            HapticFeedback.mediumImpact();
                            safeSetState(() {
                              _model.textController?.text =
                                  functions.convertListintegerToString(
                                      _model.pinCode.toList())!;
                              _model.textController?.selection =
                                  const TextSelection.collapsed(offset: 0);
                            });
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'c2f80cql' /* 3 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.pinCode.length == 4) {
                              return;
                            }

                            _model.addToPinCode(4);
                            safeSetState(() {});
                            HapticFeedback.mediumImpact();
                            safeSetState(() {
                              _model.textController?.text =
                                  functions.convertListintegerToString(
                                      _model.pinCode.toList())!;
                              _model.textController?.selection =
                                  const TextSelection.collapsed(offset: 0);
                            });
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'aso6t83j' /* 4 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.pinCode.length == 4) {
                              return;
                            }

                            _model.addToPinCode(5);
                            safeSetState(() {});
                            HapticFeedback.mediumImpact();
                            safeSetState(() {
                              _model.textController?.text =
                                  functions.convertListintegerToString(
                                      _model.pinCode.toList())!;
                              _model.textController?.selection =
                                  const TextSelection.collapsed(offset: 0);
                            });
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '1n697cgj' /* 5 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.pinCode.length == 4) {
                              return;
                            }

                            _model.addToPinCode(6);
                            safeSetState(() {});
                            HapticFeedback.mediumImpact();
                            safeSetState(() {
                              _model.textController?.text =
                                  functions.convertListintegerToString(
                                      _model.pinCode.toList())!;
                              _model.textController?.selection =
                                  const TextSelection.collapsed(offset: 0);
                            });
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              't3soyfzb' /* 6 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.pinCode.length == 4) {
                              return;
                            }

                            _model.addToPinCode(7);
                            safeSetState(() {});
                            HapticFeedback.mediumImpact();
                            safeSetState(() {
                              _model.textController?.text =
                                  functions.convertListintegerToString(
                                      _model.pinCode.toList())!;
                              _model.textController?.selection =
                                  const TextSelection.collapsed(offset: 0);
                            });
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '6vre76pf' /* 7 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.pinCode.length == 4) {
                              return;
                            }

                            _model.addToPinCode(8);
                            safeSetState(() {});
                            HapticFeedback.mediumImpact();
                            safeSetState(() {
                              _model.textController?.text =
                                  functions.convertListintegerToString(
                                      _model.pinCode.toList())!;
                              _model.textController?.selection =
                                  const TextSelection.collapsed(offset: 0);
                            });
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '0uept2aq' /* 8 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.pinCode.length == 4) {
                              return;
                            }

                            _model.addToPinCode(9);
                            safeSetState(() {});
                            HapticFeedback.mediumImpact();
                            safeSetState(() {
                              _model.textController?.text =
                                  functions.convertListintegerToString(
                                      _model.pinCode.toList())!;
                              _model.textController?.selection =
                                  const TextSelection.collapsed(offset: 0);
                            });
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ls2zx8lp' /* 9 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed(
                            'RegistrationTwoPage',
                            queryParameters: {
                              'role': serializeParam(
                                valueOrDefault(currentUserDocument?.role, 0),
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Icon(
                          Icons.check_circle,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.pinCode.length == 4) {
                              return;
                            }

                            _model.addToPinCode(0);
                            safeSetState(() {});
                            HapticFeedback.mediumImpact();
                            safeSetState(() {
                              _model.textController?.text =
                                  functions.convertListintegerToString(
                                      _model.pinCode.toList())!;
                              _model.textController?.selection =
                                  const TextSelection.collapsed(offset: 0);
                            });
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'l1gxoixa' /* 0 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.removeFromPinCode(_model.pinCode.last);
                          safeSetState(() {});
                          safeSetState(() {
                            _model.textController?.text =
                                functions.convertListintegerToString(
                                    _model.pinCode.toList())!;
                            _model.textController?.selection =
                                const TextSelection.collapsed(offset: 0);
                          });
                        },
                        child: const Icon(
                          Icons.backspace,
                          color: Color(0xFF97ADB6),
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ].addToStart(const SizedBox(height: 60.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
