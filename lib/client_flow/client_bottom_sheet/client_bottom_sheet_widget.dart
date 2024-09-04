import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/nothing_found_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ride_flows/components/get_location/get_location_widget.dart';
import '/ride_flows/map_from_page_component/map_from_page_component_widget.dart';
import '/ride_flows/map_to_page_component/map_to_page_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'client_bottom_sheet_model.dart';
export 'client_bottom_sheet_model.dart';

class ClientBottomSheetWidget extends StatefulWidget {
  const ClientBottomSheetWidget({super.key});

  @override
  State<ClientBottomSheetWidget> createState() =>
      _ClientBottomSheetWidgetState();
}

class _ClientBottomSheetWidgetState extends State<ClientBottomSheetWidget> {
  late ClientBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientBottomSheetModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: const BoxDecoration(),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeIn,
            width: double.infinity,
            constraints: const BoxConstraints(
              maxHeight: 500.0,
            ),
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
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: SingleChildScrollView(
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 10.0),
                      child: Container(
                        width: 100.0,
                        height: 42.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8F9),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: const Color(0xFFD5DDE0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '3gjgjddg' /* A */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController1,
                                  focusNode: _model.textFieldFocusNode1,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController1',
                                    const Duration(milliseconds: 2000),
                                    () async {
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      _model.fromWhere2 =
                                          await PlacesGoogleAPICall.call(
                                        input: _model.textController1.text,
                                        key:
                                            'AIzaSyBUn77A8dXVmaBsuFMvOH3-I5co-LXfhug',
                                      );

                                      _model.check = true;
                                      setState(() {});

                                      setState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    alignLabelWithHint: true,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'nnyl1zmq' /* Откуда поедем? */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0x6414181B),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                                child: VerticalDivider(
                                  thickness: 1.0,
                                  color: Color(0xFFB9B1B1),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (await getPermissionStatus(
                                      locationPermission)) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: const SizedBox(
                                            height: double.infinity,
                                            child: MapFromPageComponentWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.getFromAddress = value));

                                    setState(() {
                                      _model.textController1?.text =
                                          _model.getFromAddress!;
                                      _model.textController1?.selection =
                                          TextSelection.collapsed(
                                              offset: _model.textController1!
                                                  .text.length);
                                    });
                                  } else {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: const SizedBox(
                                            height: double.infinity,
                                            child: GetLocationWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }

                                  setState(() {});
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ledi4zn4' /* Карта */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                    ),
                    if (valueOrDefault<bool>(
                      _model.check,
                      false,
                    ))
                      Builder(
                        builder: (context) {
                          final addresses = (PlacesGoogleAPICall.address(
                                    (_model.fromWhere2?.jsonBody ?? ''),
                                  )?.toList() ??
                                  [])
                              .take(3)
                              .toList();
                          if (addresses.isEmpty) {
                            return const NothingFoundWidget();
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: addresses.length,
                            itemBuilder: (context, addressesIndex) {
                              final addressesItem = addresses[addressesIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.check!) {
                                          setState(() {
                                            _model.textController1?.text =
                                                addressesItem;
                                            _model.textController1?.selection =
                                                TextSelection.collapsed(
                                                    offset: _model
                                                        .textController1!
                                                        .text
                                                        .length);
                                          });
                                        } else {
                                          setState(() {
                                            _model.textController2?.text =
                                                addressesItem;
                                            _model.textController2?.selection =
                                                TextSelection.collapsed(
                                                    offset: _model
                                                        .textController2!
                                                        .text
                                                        .length);
                                          });
                                        }

                                        _model.fromWhere =
                                            await GoogleAPICall.call(
                                          address: _model.textController1.text,
                                          aPIKey:
                                              'AIzaSyBUn77A8dXVmaBsuFMvOH3-I5co-LXfhug',
                                        );

                                        FFAppState().fromWhere =
                                            functions.convertToLatLng(
                                                GoogleAPICall.latLngs(
                                          (_model.fromWhere?.jsonBody ?? ''),
                                        )!
                                                    .first);
                                        FFAppState().update(() {});

                                        setState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            FFIcons.ktimer,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Text(
                                                    addressesItem,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1.0,
                                      color: Color(0xCCBEBEBE),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    if (FFAppState().fromWhere != null)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 42.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F8F9),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: const Color(0xFFD5DDE0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ggtm18hc' /* B */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.textController2,
                                    focusNode: _model.textFieldFocusNode2,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController2',
                                      const Duration(milliseconds: 2000),
                                      () async {
                                        await Future.delayed(
                                            const Duration(milliseconds: 100));
                                        _model.toWhere2 =
                                            await PlacesGoogleAPICall.call(
                                          input: _model.textController2.text,
                                          key:
                                              'AIzaSyBUn77A8dXVmaBsuFMvOH3-I5co-LXfhug',
                                        );

                                        _model.check = false;
                                        setState(() {});

                                        setState(() {});
                                      },
                                    ),
                                    autofocus: false,
                                    textInputAction: TextInputAction.search,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      alignLabelWithHint: true,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'qj26n0uk' /* Куда поедем? */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0x6414181B),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 10.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                  child: VerticalDivider(
                                    thickness: 1.0,
                                    color: Color(0xFFB9B1B1),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (await getPermissionStatus(
                                        locationPermission)) {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: const SizedBox(
                                              height: double.infinity,
                                              child: MapToPageComponentWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(
                                          () => _model.getToAddress = value));

                                      setState(() {
                                        _model.textController2?.text =
                                            _model.getToAddress!;
                                        _model.textController2?.selection =
                                            TextSelection.collapsed(
                                                offset: _model.textController2!
                                                    .text.length);
                                      });
                                    } else {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: const SizedBox(
                                              height: double.infinity,
                                              child: GetLocationWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }

                                    setState(() {});
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '63q8ctha' /* Карта */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                      ),
                    if (!valueOrDefault<bool>(
                      _model.check,
                      true,
                    ))
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final addresses = (PlacesGoogleAPICall.address(
                                      (_model.toWhere2?.jsonBody ?? ''),
                                    )?.toList() ??
                                    [])
                                .take(3)
                                .toList();
                            if (addresses.isEmpty) {
                              return const NothingFoundWidget();
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: addresses.length,
                              itemBuilder: (context, addressesIndex) {
                                final addressesItem = addresses[addressesIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.check!) {
                                            setState(() {
                                              _model.textController1?.text =
                                                  addressesItem;
                                              _model.textController1
                                                      ?.selection =
                                                  TextSelection.collapsed(
                                                      offset: _model
                                                          .textController1!
                                                          .text
                                                          .length);
                                            });
                                          } else {
                                            setState(() {
                                              _model.textController2?.text =
                                                  addressesItem;
                                              _model.textController2
                                                      ?.selection =
                                                  TextSelection.collapsed(
                                                      offset: _model
                                                          .textController2!
                                                          .text
                                                          .length);
                                            });
                                          }

                                          _model.toWhere =
                                              await GoogleAPICall.call(
                                            address:
                                                _model.textController2.text,
                                            aPIKey:
                                                'AIzaSyBUn77A8dXVmaBsuFMvOH3-I5co-LXfhug',
                                          );

                                          FFAppState().toWhere =
                                              functions.convertToLatLng(
                                                  GoogleAPICall.latLngs(
                                            (_model.toWhere?.jsonBody ?? ''),
                                          )!
                                                      .first);
                                          FFAppState().update(() {});

                                          setState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              FFIcons.ktimer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Text(
                                                      addressesItem,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 17.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1.0,
                                        color: Color(0xCCBEBEBE),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: ((FFAppState().toWhere == null) ||
                                (FFAppState().fromWhere == null))
                            ? null
                            : () async {
                                var shouldSetState = false;
                                if ((FFAppState().fromWhere == null) ||
                                    (FFAppState().toWhere == null)) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Address is not found'),
                                        content: const Text(
                                            'Please write full address please or try another address'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (shouldSetState) setState(() {});
                                  return;
                                }

                                var ridesRecordReference =
                                    RidesRecord.collection.doc();
                                await ridesRecordReference
                                    .set(createRidesRecordData(
                                  userId: currentUserReference,
                                  fromLocation: FFAppState().fromWhere,
                                  toLocation: FFAppState().toWhere,
                                  fromLoc: _model.textController1.text,
                                  toLoc: _model.textController2.text,
                                ));
                                _model.newOrderRide =
                                    RidesRecord.getDocumentFromData(
                                        createRidesRecordData(
                                          userId: currentUserReference,
                                          fromLocation: FFAppState().fromWhere,
                                          toLocation: FFAppState().toWhere,
                                          fromLoc: _model.textController1.text,
                                          toLoc: _model.textController2.text,
                                        ),
                                        ridesRecordReference);
                                shouldSetState = true;

                                context.pushNamed(
                                  'Client1',
                                  queryParameters: {
                                    'newRide': serializeParam(
                                      _model.newOrderRide,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'newRide': _model.newOrderRide,
                                  },
                                );

                                if (shouldSetState) setState(() {});
                              },
                        text: FFLocalizations.of(context).getText(
                          'smursx0f' /* Заказать такси */,
                        ),
                        options: FFButtonOptions(
                          height: 52.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                          disabledColor: const Color(0xFFE3E3E3),
                        ),
                      ),
                    ),
                  ].addToEnd(const SizedBox(height: 30.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
