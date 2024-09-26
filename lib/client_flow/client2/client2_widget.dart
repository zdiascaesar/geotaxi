import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'client2_model.dart';
export 'client2_model.dart';

class Client2Widget extends StatefulWidget {
  const Client2Widget({
    super.key,
    required this.findingDriver,
    required this.searchingType,
  });

  final DocumentReference? findingDriver;
  final int? searchingType;

  @override
  State<Client2Widget> createState() => _Client2WidgetState();
}

class _Client2WidgetState extends State<Client2Widget>
    with TickerProviderStateMixin {
  late Client2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Client2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.myRide = await queryRidesRecordOnce(
        queryBuilder: (ridesRecord) => ridesRecord
            .where(
              'user_id',
              isEqualTo: currentUserReference,
            )
            .where(
              'status',
              isEqualTo: 0,
            )
            .where(
              'created_at',
              isLessThanOrEqualTo: getCurrentTimestamp,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.myRide?.status == 1) {
        context.goNamed(
          'Client3',
          queryParameters: {
            'foundDriver': serializeParam(
              widget.findingDriver,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      } else {
        while (_model.myRide?.status == 0) {
          await Future.delayed(const Duration(milliseconds: 1000));
        }
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RidesRecord>(
      stream: RidesRecord.getDocument(widget.findingDriver!)
        ..listen((client2RidesRecord) async {
          if (_model.client2PreviousSnapshot != null &&
              !const RidesRecordDocumentEquality()
                  .equals(client2RidesRecord, _model.client2PreviousSnapshot)) {
            await actions.checkRideStatus(
              widget.findingDriver!,
              1,
              () async {
                await widget.findingDriver!.update(createRidesRecordData(
                  status: 1,
                ));

                context.pushNamed(
                  'Client3',
                  queryParameters: {
                    'foundDriver': serializeParam(
                      widget.findingDriver,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              },
            );

            safeSetState(() {});
          }
          _model.client2PreviousSnapshot = client2RidesRecord;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
              ),
            ),
          );
        }

        final client2RidesRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0x3F000000),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 100.0, 0.0, 0.0),
                                  child: SizedBox(
                                    width: 275.0,
                                    height: 275.0,
                                    child: Stack(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 275.0,
                                            height: 275.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0x66FFFFFF),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation1']!),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 80.0,
                                            height: 80.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x9AFFFFFF),
                                              shape: BoxShape.circle,
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation2']!),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 139.0,
                                            height: 139.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x9AFFFFFF),
                                              shape: BoxShape.circle,
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation3']!),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/car_top.png',
                                              width: 50.0,
                                              height: 94.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 40.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'bjlff6bq' /* Поиск такси.. */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 40.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      ruText: 'Отменить?',
                                                      enText: 'Cancel Ride?',
                                                      trText:
                                                          'Yolculuk iptal edilsin mi?',
                                                    )),
                                                    content: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      ruText:
                                                          'Ищем водителя! Вы хотите отменить?',
                                                      enText:
                                                          'We are looking for a driver! Do you want to cancel it?',
                                                      trText:
                                                          'Şoför arıyoruz! İptal etmek istiyor musunuz?',
                                                    )),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          ruText: 'Отмена',
                                                          enText: 'Cancel',
                                                          trText: 'İptal etmek',
                                                        )),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          ruText:
                                                              'Да, отменить',
                                                          enText: 'Confirm',
                                                          trText: 'Onaylamak',
                                                        )),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await client2RidesRecord.reference
                                            .update(createRidesRecordData(
                                          status: 9,
                                          cancelled: true,
                                          finished: true,
                                        ));

                                        context.goNamed('HomePage');
                                      }
                                    },
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'fydrw0cz' /* Отмена */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
