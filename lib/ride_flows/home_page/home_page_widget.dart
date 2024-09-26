import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/client_flow/client_bottom_sheet/client_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ride_flows/components/get_location/get_location_widget.dart';
import '/side_bar_client/side_bar/side_bar_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      unawaited(
        () async {
          await actions.lockOrientation();
        }(),
      );
      if (valueOrDefault<bool>(
              currentUserDocument?.fullRegistrationCompleted, false) ==
          true) {
        _model.locationIsTrue = await actions.chekLocationPermission(
          context,
        );
        if (_model.locationIsTrue!) {
          if (await getPermissionStatus(locationPermission)) {
            if (valueOrDefault(currentUserDocument?.role, 0) == 1) {
              _model.ongoingRide = await queryRidesRecordOnce(
                queryBuilder: (ridesRecord) => ridesRecord
                    .where(
                      'assigned_driver',
                      isEqualTo: currentUserReference,
                    )
                    .where(
                      'finished',
                      isEqualTo: false,
                    ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              if (_model.ongoingRide != null) {
                context.goNamed(
                  'Driver4',
                  queryParameters: {
                    'foundRide': serializeParam(
                      _model.ongoingRide?.reference,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              } else {
                await currentUserReference!.update(createUsersRecordData(
                  driverLocation: currentUserLocationValue,
                ));
              }

              return;
            } else {
              _model.ongoingRideClient = await queryRidesRecordOnce(
                queryBuilder: (ridesRecord) => ridesRecord
                    .where(
                      'user_id',
                      isEqualTo: currentUserReference,
                    )
                    .where(
                      'finished',
                      isEqualTo: false,
                    ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              if (_model.ongoingRideClient != null) {
                context.goNamed(
                  'Client3',
                  queryParameters: {
                    'foundDriver': serializeParam(
                      _model.ongoingRideClient?.reference,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              } else {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: const Color(0x00FFFFFF),
                  barrierColor: const Color(0x00FFFFFF),
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: const ClientBottomSheetWidget(),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              }

              return;
            }
          } else {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              isDismissible: false,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: const GetLocationWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));

            return;
          }
        } else {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            isDismissible: false,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: const GetLocationWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        }
      } else {
        context.pushNamed(
          'RegistrationTwoPage',
          queryParameters: {
            'role': serializeParam(
              valueOrDefault(currentUserDocument?.role, 0),
              ParamType.int,
            ),
          }.withoutNulls,
        );

        return;
      }
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: Visibility(
            visible: valueOrDefault(currentUserDocument?.role, 0) == 0,
            child: AuthUserStreamWidget(
              builder: (context) => FloatingActionButton.extended(
                onPressed: () async {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: const Color(0x00FFFFFF),
                    barrierColor: const Color(0x00FFFFFF),
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () => FocusScope.of(context).unfocus(),
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: const ClientBottomSheetWidget(),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                icon: const Icon(
                  Icons.local_taxi_rounded,
                  color: Colors.white,
                ),
                elevation: 8.0,
                label: Text(
                  FFLocalizations.of(context).getText(
                    'cn6pktba' /* Заказать такси */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ),
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
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
          body: Builder(
            builder: (context) {
              if (valueOrDefault(currentUserDocument?.role, 0) == 0) {
                return FutureBuilder<List<UsersRecord>>(
                  future: queryUsersRecordOnce(
                    queryBuilder: (usersRecord) => usersRecord
                        .where(
                          'role',
                          isEqualTo: 1,
                        )
                        .where(
                          'ready_for_work',
                          isEqualTo: true,
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
                    List<UsersRecord> customMapUsersRecordList = snapshot.data!
                        .where((u) => u.uid != currentUserUid)
                        .toList();

                    return SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: custom_widgets.CustomMap(
                        width: double.infinity,
                        height: double.infinity,
                        currentDeviceLocation: currentUserLocationValue!,
                        vehicleLocations: customMapUsersRecordList
                            .map((e) => e.driverLocation)
                            .withoutNulls
                            .toList(),
                        fromWhere: FFAppState().fromWhere,
                        toWhere: FFAppState().toWhere,
                      ),
                    );
                  },
                );
              } else {
                return Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: custom_widgets.CustomMapDriver(
                        width: double.infinity,
                        height: double.infinity,
                        isStartFromDriver: true,
                        fromWhere: currentUserLocationValue,
                        toWhere: null,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              width: double.infinity,
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
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 20.0),
                                        child: Container(
                                          width: 30.0,
                                          height: 5.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: AuthUserStreamWidget(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.readyForWork,
                                                          false) ==
                                                      false)
                                                  ? null
                                                  : () async {
                                                      if ((await getPermissionStatus(
                                                              locationPermission)) &&
                                                          !isWeb) {
                                                        context.pushNamed(
                                                            'Driver1');
                                                      } else {
                                                        if (isWeb) {
                                                          context.pushNamed(
                                                              'Driver1');
                                                        } else {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            isDismissible:
                                                                false,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      const GetLocationWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }
                                                      }
                                                    },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '4794zlzn' /* Поиск нового заказа */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                disabledColor:
                                                    const Color(0xFFDCDCDC),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 10.0)),
                                    ),
                                  ].addToEnd(const SizedBox(height: 30.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
