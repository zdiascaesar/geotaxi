import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ride_flows/components/car_arrival_modal/car_arrival_modal_widget.dart';
import '/side_bar_client/side_bar/side_bar_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'client4_model.dart';
export 'client4_model.dart';

class Client4Widget extends StatefulWidget {
  const Client4Widget({
    super.key,
    required this.foundDriver,
  });

  final DocumentReference? foundDriver;

  @override
  State<Client4Widget> createState() => _Client4WidgetState();
}

class _Client4WidgetState extends State<Client4Widget> {
  late Client4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Client4Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () => FocusScope.of(dialogContext).unfocus(),
              child: CarArrivalModalWidget(
                carArrival: widget.foundDriver!,
              ),
            ),
          );
        },
      );

      _model.next = true;
      setState(() {});
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

    return Builder(
      builder: (context) => StreamBuilder<RidesRecord>(
        stream: RidesRecord.getDocument(widget.foundDriver!)
          ..listen((client4RidesRecord) async {
            if (_model.client4PreviousSnapshot != null &&
                !const RidesRecordDocumentEquality().equals(
                    client4RidesRecord, _model.client4PreviousSnapshot)) {
              context.goNamed(
                'Client5',
                queryParameters: {
                  'ridePayment': serializeParam(
                    widget.foundDriver,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
              );

              setState(() {});
            }
            _model.client4PreviousSnapshot = client4RidesRecord;
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

          final client4RidesRecord = snapshot.data!;

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
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
                  StreamBuilder<List<DriversRecord>>(
                    stream: queryDriversRecord(),
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
                      List<DriversRecord> customMapDriversRecordList =
                          snapshot.data!;

                      return SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.CustomMap(
                          width: double.infinity,
                          height: double.infinity,
                          currentDeviceLocation: currentUserLocationValue!,
                          vehicleLocations: customMapDriversRecordList
                              .map((e) => e.latlng)
                              .withoutNulls
                              .toList(),
                          fromWhere: client4RidesRecord.fromLocation,
                          toWhere: client4RidesRecord.toLocation,
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(
                          client4RidesRecord.assignedDriver!),
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

                        final containerUsersRecord = snapshot.data!;

                        return Container(
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: StreamBuilder<List<CarRecord>>(
                                  stream: queryCarRecord(
                                    parent: containerUsersRecord.reference,
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 30.0,
                                          height: 30.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 30.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<CarRecord> rowCarRecordList =
                                        snapshot.data!;
                                    final rowCarRecord =
                                        rowCarRecordList.isNotEmpty
                                            ? rowCarRecordList.first
                                            : null;

                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 70.0,
                                          height: 70.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            containerUsersRecord.photoUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    containerUsersRecord
                                                        .displayName,
                                                    'NULL',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 19.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      FFIcons
                                                          .kstarleadinghalffilled2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      size: 24.0,
                                                    ),
                                                    StreamBuilder<
                                                        List<ReviewsRecord>>(
                                                      stream:
                                                          queryReviewsRecord(
                                                        parent:
                                                            containerUsersRecord
                                                                .reference,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ReviewsRecord>
                                                            textReviewsRecordList =
                                                            snapshot.data!;

                                                        return Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions
                                                                .avgRating(
                                                                    textReviewsRecordList
                                                                        .length
                                                                        .toDouble(),
                                                                    containerUsersRecord
                                                                        .rating)
                                                                .toString(),
                                                            '0.0',
                                                          ).maybeHandleOverflow(
                                                              maxChars: 3),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: const Color(
                                                                    0x99000000),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                    Text(
                                                      '${rowCarRecord?.brand} ${rowCarRecord?.model}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: const Color(
                                                                0x99000000),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 4.0)),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    rowCarRecord?.plate,
                                                    '123456',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'ChatPage',
                                            queryParameters: {
                                              'userChat': serializeParam(
                                                client4RidesRecord
                                                    .assignedDriver,
                                                ParamType.DocumentReference,
                                              ),
                                              'ride': serializeParam(
                                                widget.foundDriver,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '3drkf7li' /* Написать водителю */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 42.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 12.0,
                                      borderWidth: 2.0,
                                      buttonSize: 42.0,
                                      icon: Icon(
                                        FFIcons.kmultiply,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.goNamed(
                                          'Client8',
                                          queryParameters: {
                                            'ride': serializeParam(
                                              widget.foundDriver,
                                              ParamType.DocumentReference,
                                            ),
                                            'driver': serializeParam(
                                              client4RidesRecord.assignedDriver,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                              ),
                            ].addToEnd(const SizedBox(height: 30.0)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
