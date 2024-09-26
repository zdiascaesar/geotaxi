import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nothing_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'balance_page_model.dart';
export 'balance_page_model.dart';

class BalancePageWidget extends StatefulWidget {
  const BalancePageWidget({super.key});

  @override
  State<BalancePageWidget> createState() => _BalancePageWidgetState();
}

class _BalancePageWidgetState extends State<BalancePageWidget>
    with TickerProviderStateMixin {
  late BalancePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BalancePageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
          backgroundColor: const Color(0xFFF8F8F8),
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
                'tllr0z7z' /* Баланс и оплата */,
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
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 240.0,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 130.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 170.0,
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
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 48.0,
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          FFIcons.kdollarsigncircle,
                                          color: Colors.white,
                                          size: 26.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kz8q4tkn' /* Баланс */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault<String>(
                                                        valueOrDefault(
                                                                currentUserDocument
                                                                    ?.balance,
                                                                0.0)
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'fs2ysyu7' /* USDT */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(width: 5.0)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF0EFEF),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          if (valueOrDefault(
                                                  currentUserDocument?.role,
                                                  0) ==
                                              0) {
                                            await BalaceRecord.createDoc(
                                                    currentUserReference!)
                                                .set(createBalaceRecordData(
                                              type: 0,
                                              amount: 25.0,
                                              at: getCurrentTimestamp,
                                            ));

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              balance: 1000.0,
                                            ));
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    ruText: 'Баланс пополнен',
                                                    enText:
                                                        'Balance replenished',
                                                    trText:
                                                        'Bakiye yenileniyor',
                                                  )),
                                                  content: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    ruText:
                                                        'Вы пополнили 1000 usdt',
                                                    enText:
                                                        'You have replenished 1000 usdt',
                                                    trText:
                                                        '1000 usdt yüklediniz',
                                                  )),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            await BalaceRecord.createDoc(
                                                    currentUserReference!)
                                                .set(createBalaceRecordData(
                                              type: 1,
                                              amount: 25.0,
                                              at: getCurrentTimestamp,
                                            ));

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'balance':
                                                      FieldValue.increment(
                                                          -(25.0)),
                                                },
                                              ),
                                            });
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    ruText:
                                                        'Средства отправлены',
                                                    enText:
                                                        'The funds have been sent.',
                                                    trText: 'Gönderilen fonlar',
                                                  )),
                                                  content: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    ruText:
                                                        'Ваши средства отправлены на ваш криптокошелек',
                                                    enText:
                                                        'Your funds have been sent to your crypto wallet.',
                                                    trText:
                                                        'Paranız kripto cüzdanınıza gönderildi',
                                                  )),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          HapticFeedback.lightImpact();
                                        },
                                        text: valueOrDefault(
                                                    currentUserDocument?.role,
                                                    0) ==
                                                0
                                            ? FFLocalizations.of(context)
                                                .getVariableText(
                                                ruText: 'Пополнить',
                                                enText: 'Pop up',
                                                trText: 'Yükleme',
                                              )
                                            : FFLocalizations.of(context)
                                                .getVariableText(
                                                ruText: 'Вывести',
                                                enText: 'Withdraw',
                                                trText: 'Geri çekilmek',
                                              ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          2.0,
                          0.0,
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'h8ck0ntc' /* История операций */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: const Alignment(-1.0, 0),
                                child: TabBar(
                                  labelColor:
                                      FlutterFlowTheme.of(context).primary,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  unselectedLabelStyle: const TextStyle(),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  tabs: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Tab(
                                        text: valueOrDefault(
                                                    currentUserDocument?.role,
                                                    0) ==
                                                0
                                            ? FFLocalizations.of(context)
                                                .getVariableText(
                                                ruText: 'Пополнение',
                                                enText: 'Pop up',
                                                trText: 'Yükleme',
                                              )
                                            : FFLocalizations.of(context)
                                                .getVariableText(
                                                ruText: 'Вывод',
                                                enText: 'Withdraw',
                                                trText: 'Geri çekilmek',
                                              ),
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        '1vft3rxr' /* Оплата поездок */,
                                      ),
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [() async {}, () async {}][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) =>
                                          StreamBuilder<List<BalaceRecord>>(
                                        stream: queryBalaceRecord(
                                          parent: currentUserReference,
                                          queryBuilder: (balaceRecord) =>
                                              balaceRecord.where(
                                            'type',
                                            isEqualTo: valueOrDefault(
                                                        currentUserDocument
                                                            ?.role,
                                                        0) ==
                                                    0
                                                ? 0
                                                : 1,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 30.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<BalaceRecord>
                                              listViewBalaceRecordList =
                                              snapshot.data!;
                                          if (listViewBalaceRecordList
                                              .isEmpty) {
                                            return const Center(
                                              child: NothingFoundWidget(),
                                            );
                                          }

                                          return ListView.separated(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              20.0,
                                              0,
                                              30.0,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewBalaceRecordList.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 10.0),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewBalaceRecord =
                                                  listViewBalaceRecordList[
                                                      listViewIndex];
                                              return Container(
                                                width: 100.0,
                                                height: 87.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFF7F8F9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Text(
                                                        dateTimeFormat(
                                                          "d/M/y",
                                                          listViewBalaceRecord
                                                              .at!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            FFIcons.kcreditcard,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          Text(
                                                            '+${listViewBalaceRecord.amount.toString()}USDT',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    StreamBuilder<List<BalaceRecord>>(
                                      stream: queryBalaceRecord(
                                        parent: currentUserReference,
                                        queryBuilder: (balaceRecord) =>
                                            balaceRecord.where(
                                          'type',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 30.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<BalaceRecord>
                                            listViewBalaceRecordList =
                                            snapshot.data!;
                                        if (listViewBalaceRecordList.isEmpty) {
                                          return const Center(
                                            child: NothingFoundWidget(),
                                          );
                                        }

                                        return ListView.separated(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            20.0,
                                            0,
                                            30.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewBalaceRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewBalaceRecord =
                                                listViewBalaceRecordList[
                                                    listViewIndex];
                                            return Container(
                                              width: 100.0,
                                              height: 87.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF7F8F9),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Text(
                                                      dateTimeFormat(
                                                        "d/M/y",
                                                        listViewBalaceRecord
                                                            .at!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          FFIcons.kcreditcard,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Text(
                                                            '${valueOrDefault(currentUserDocument?.role, 0) == 0 ? '-' : '+'}${listViewBalaceRecord.amount.toString()}USDT',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].addToStart(const SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
