import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'faq_page_model.dart';
export 'faq_page_model.dart';

class FaqPageWidget extends StatefulWidget {
  const FaqPageWidget({super.key});

  @override
  State<FaqPageWidget> createState() => _FaqPageWidgetState();
}

class _FaqPageWidgetState extends State<FaqPageWidget> {
  late FaqPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaqPageModel());
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
                '2dr0rh6v' /* Частые вопросы */,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'rtoqcms4' /* Аккаунт */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'FaqQuestionPage',
                              queryParameters: {
                                'title': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'iwi8mtlp' /* Разблокировать учетную запись */,
                                  ),
                                  ParamType.String,
                                ),
                                'description': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    '74utwbl0' /* Для консультации и заказа услу... */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'm3ix8s9l' /* Разблокировать учетную запись */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xFFD5D5D5),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'FaqQuestionPage',
                              queryParameters: {
                                'title': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'ez2kjs1l' /* Сменить номер телефона */,
                                  ),
                                  ParamType.String,
                                ),
                                'description': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'lxp0ihnz' /* Чтобы сменить номер телефона в... */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'dbxneesr' /* Сменить номер телефона */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xFFD5D5D5),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'FaqQuestionPage',
                              queryParameters: {
                                'title': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'tjynlicv' /* Конфиденциальность */,
                                  ),
                                  ParamType.String,
                                ),
                                'description': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'qtkbspgt' /* Мы понимаем, насколько важна к... */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'wun8up70' /* Конфиденциальность */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xFFD5D5D5),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'kxu2vq2q' /* Оплата */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'FaqQuestionPage',
                              queryParameters: {
                                'title': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'dgkw0vyw' /* Способ оплаты */,
                                  ),
                                  ParamType.String,
                                ),
                                'description': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    '2kxpi0k6' /* В настоящее время наше такси п... */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ux3dk2t3' /* Способ оплаты */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xFFD5D5D5),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'FaqQuestionPage',
                              queryParameters: {
                                'title': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'lk6oqcjg' /* Оценка поездки */,
                                  ),
                                  ParamType.String,
                                ),
                                'description': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'xd0mewul' /* После завершения поездки вы мо... */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'sr48nyg2' /* Оценка поездки */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xFFD5D5D5),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'FaqQuestionPage',
                              queryParameters: {
                                'title': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'kv8joo1j' /* Отмена поездки */,
                                  ),
                                  ParamType.String,
                                ),
                                'description': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'l94zp1e6' /* Оплата за отмену поездки:

1.К... */
                                    ,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ycg5zvgi' /* Оплата за отмену поездки */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xFFD5D5D5),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'FaqQuestionPage',
                              queryParameters: {
                                'title': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    '9n1t4hgu' /* Повреждение */,
                                  ),
                                  ParamType.String,
                                ),
                                'description': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'k9ljqhi0' /* 1. В каких случаях я должен пл... */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'xd21cs79' /* Оплата за повреждение */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xFFD5D5D5),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'FaqQuestionPage',
                              queryParameters: {
                                'title': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'wgdii5os' /* Цены выше, чем ожидалось */,
                                  ),
                                  ParamType.String,
                                ),
                                'description': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'dpuqz9mn' /* 1. Почему цена моей поездки ок... */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'q4p8z9ms' /* Цена выше, чем ожидалось */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xFFD5D5D5),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '9d56d6eo' /* Помощь */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('CarAccidentPage');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'xzu39tt2' /* Попал в аварию */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xFFD5D5D5),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('FaqDetailPage');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'he0zmrg9' /* Я оставил предмет в машине */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xFFD5D5D5),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                  ]
                      .divide(const SizedBox(height: 20.0))
                      .addToStart(const SizedBox(height: 20.0))
                      .addToEnd(const SizedBox(height: 50.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
