import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/side_bar_client/side_bar/side_bar_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'client1_model.dart';
export 'client1_model.dart';

class Client1Widget extends StatefulWidget {
  const Client1Widget({
    super.key,
    required this.newRide,
    required this.drivers,
  });

  final RidesRecord? newRide;
  final List<DocumentReference>? drivers;

  @override
  State<Client1Widget> createState() => _Client1WidgetState();
}

class _Client1WidgetState extends State<Client1Widget> {
  late Client1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Client1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToLats(widget.newRide!.fromLocation!);
      safeSetState(() {});
      _model.addToLats(widget.newRide!.toLocation!);
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          drawer: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.sideBarModel,
              updateCallback: () => safeSetState(() {}),
              child: SideBarWidget(
                action: () async {},
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 54.0,
              icon: const Icon(
                FFIcons.kline3horizontal,
                color: Color(0xFF1C1C1E),
                size: 24.0,
              ),
              onPressed: () async {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
            actions: const [],
            centerTitle: true,
            elevation: 0.5,
          ),
          body: Stack(
            children: [
              StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) => usersRecord.where(
                    'role',
                    isEqualTo: 1,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: SpinKitPulse(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 30.0,
                        ),
                      ),
                    );
                  }
                  List<UsersRecord> customMapUsersRecordList = snapshot.data!;

                  return SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.CustomMap(
                      width: double.infinity,
                      height: double.infinity,
                      currentDeviceLocation: widget.newRide!.fromLocation!,
                      fromWhere: FFAppState().fromWhere,
                      toWhere: FFAppState().toWhere,
                      vehicleLocations: customMapUsersRecordList
                          .map((e) => e.driverLocation)
                          .withoutNulls
                          .toList(),
                    ),
                  );
                },
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          2.0,
                          0.0,
                        ),
                        spreadRadius: 4.0,
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 20.0),
                          child: Container(
                            width: 30.0,
                            height: 5.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 2.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (valueOrDefault(
                                          currentUserDocument?.balance, 0.0) <
                                      widget.newRide!.cost) {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Insufficient funds'),
                                                  content: const Text(
                                                      'Please pop-up your banace'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: const Text('Confirm'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      context.pushNamed('BalancePage');
                                    } else {
                                      context.safePop();
                                    }
                                  } else {
                                    await widget.newRide!.reference
                                        .update(createRidesRecordData(
                                      carType: 0,
                                      status: 0,
                                      cost: 10.0,
                                      cancelled: false,
                                      finished: false,
                                      readyToPickup: false,
                                      createdAt: getCurrentTimestamp,
                                      uid: widget.newRide?.reference.id,
                                    ));
                                    FFAppState().fromWhere = null;
                                    FFAppState().toWhere = null;
                                    FFAppState().addressFromMap = '';
                                    FFAppState().addressToMap = '';
                                    safeSetState(() {});

                                    context.goNamed(
                                      'Client2',
                                      queryParameters: {
                                        'findingDriver': serializeParam(
                                          widget.newRide?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                        'searchingType': serializeParam(
                                          0,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 160.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          child: Image.asset(
                                            'assets/images/standard.png',
                                            width: 140.0,
                                            height: 94.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'i2qwaq2n' /* Стандарт */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '47gr4y9l' /* 3 мин */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0x99000000),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '6x8jcbrc' /* 1 USDT */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ]
                                          .divide(const SizedBox(height: 7.0))
                                          .around(const SizedBox(height: 7.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 2.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (valueOrDefault(
                                          currentUserDocument?.balance, 0.0) <
                                      widget.newRide!.cost) {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Insufficient funds'),
                                                  content: const Text(
                                                      'Please pop-up your banace'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: const Text('Confirm'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      context.pushNamed('BalancePage');
                                    } else {
                                      context.safePop();
                                    }
                                  } else {
                                    await widget.newRide!.reference
                                        .update(createRidesRecordData(
                                      carType: 0,
                                      status: 0,
                                      cost: 10.0,
                                      cancelled: false,
                                      finished: false,
                                      readyToPickup: false,
                                      createdAt: getCurrentTimestamp,
                                      uid: widget.newRide?.reference.id,
                                    ));
                                    FFAppState().fromWhere = null;
                                    FFAppState().toWhere = null;
                                    FFAppState().addressFromMap = '';
                                    FFAppState().addressToMap = '';
                                    safeSetState(() {});

                                    context.goNamed(
                                      'Client2',
                                      queryParameters: {
                                        'findingDriver': serializeParam(
                                          widget.newRide?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                        'searchingType': serializeParam(
                                          1,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 160.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          child: Image.asset(
                                            'assets/images/exec.png',
                                            width: 140.0,
                                            height: 94.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5x20xont' /* Комфорт */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6g97qk05' /* 5 мин */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0x99000000),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '7ldgnlrh' /* 1 USDT */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ]
                                          .divide(const SizedBox(height: 7.0))
                                          .around(const SizedBox(height: 7.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 2.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (valueOrDefault(
                                          currentUserDocument?.balance, 0.0) <
                                      widget.newRide!.cost) {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Insufficient funds'),
                                                  content: const Text(
                                                      'Please pop-up your banace'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: const Text('Confirm'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      context.pushNamed('BalancePage');
                                    } else {
                                      context.safePop();
                                    }
                                  } else {
                                    await widget.newRide!.reference
                                        .update(createRidesRecordData(
                                      carType: 0,
                                      status: 0,
                                      cost: 10.0,
                                      cancelled: false,
                                      finished: false,
                                      readyToPickup: false,
                                      createdAt: getCurrentTimestamp,
                                      uid: widget.newRide?.reference.id,
                                    ));
                                    FFAppState().fromWhere = null;
                                    FFAppState().toWhere = null;
                                    FFAppState().addressFromMap = '';
                                    FFAppState().addressToMap = '';
                                    safeSetState(() {});

                                    context.goNamed(
                                      'Client2',
                                      queryParameters: {
                                        'findingDriver': serializeParam(
                                          widget.newRide?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                        'searchingType': serializeParam(
                                          2,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 160.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          child: Image.asset(
                                            'assets/images/exec.png',
                                            width: 140.0,
                                            height: 94.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5kl9k8tv' /* VIP */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nt4sbw0g' /* 13 мин */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0x99000000),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'wj4xob17' /* 1 USDT */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ]
                                          .divide(const SizedBox(height: 7.0))
                                          .around(const SizedBox(height: 7.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(width: 10.0))
                              .addToStart(const SizedBox(width: 16.0))
                              .addToEnd(const SizedBox(width: 16.0)),
                        ),
                      ),
                    ].addToEnd(const SizedBox(height: 60.0)),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.9, 0.09),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: const Icon(
                    FFIcons.kchevronbackward,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
