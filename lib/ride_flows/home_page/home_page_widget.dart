import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/client_flow/client_bottom_sheet/client_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/side_bar_client/side_bar/side_bar_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      _model.locationPermission = await actions.chekLocationPermission(
        context,
      );
      if (_model.locationPermission!) {
        if (valueOrDefault(currentUserDocument?.role, 0) == 1) {
          _model.driverFound = await queryDriversRecordOnce(
            queryBuilder: (driversRecord) => driversRecord.where(
              'created_by',
              isEqualTo: currentUserReference,
            ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          if (_model.driverFound != null) {
            await _model.driverFound!.reference.update(createDriversRecordData(
              latlng: currentUserLocationValue,
            ));
          } else {
            await DriversRecord.collection.doc().set(createDriversRecordData(
                  createdBy: currentUserReference,
                  latlng: currentUserLocationValue,
                ));
          }

          return;
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

          return;
        }
      }
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              updateCallback: () => setState(() {}),
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
                return FlutterFlowStaticMap(
                  location: currentUserLocationValue!,
                  apiKey:
                      'pk.eyJ1IjoiNmVremhhbiIsImEiOiJjbHppM214dWswYjB1MmtzNDRsdno4ZmFxIn0.LVh6MJeD2z0AViZebxN1-A',
                  style: mapbox.MapBoxStyle.Light,
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  fit: BoxFit.fill,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  markerColor: FlutterFlowTheme.of(context).primary,
                  markerUrl:
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/geo-taxi-zosi7j/assets/hcnrdhbirp8d/ic_loc-2.png',
                  zoom: 14,
                  tilt: 0,
                  rotation: 0,
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
                    Column(
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
                                          builder: (context) => FFButtonWidget(
                                            onPressed: (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.readyForWork,
                                                        false) ==
                                                    false)
                                                ? null
                                                : () async {
                                                    if (await getPermissionStatus(
                                                        locationPermission)) {
                                                      context
                                                          .pushNamed('Driver1');
                                                    } else {
                                                      await actions
                                                          .chekLocationPermission(
                                                        context,
                                                      );

                                                      context
                                                          .pushNamed('Driver1');
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
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                              disabledColor: const Color(0xFFDCDCDC),
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
