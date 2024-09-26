import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/on_boarding_component/on_boarding_component_widget.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'onboarding_page_model.dart';
export 'onboarding_page_model.dart';

class OnboardingPageWidget extends StatefulWidget {
  const OnboardingPageWidget({super.key});

  @override
  State<OnboardingPageWidget> createState() => _OnboardingPageWidgetState();
}

class _OnboardingPageWidgetState extends State<OnboardingPageWidget> {
  late OnboardingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(locationPermission);
    });
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
          backgroundColor: Colors.white,
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
            actions: const [],
            centerTitle: false,
            elevation: 0.5,
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      wrapWithModel(
                        model: _model.onBoardingComponentModel1,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: OnBoardingComponentWidget(
                          title: FFLocalizations.of(context).getText(
                            '2y90169t' /* Закажите поездку */,
                          ),
                          descitpion: FFLocalizations.of(context).getText(
                            '5gzzengp' /* Быстрая подача машины от ближа... */,
                          ),
                          pageNumber: 1,
                          image:
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/geo-taxi-zosi7j/assets/i8v973wqmme3/Графика-2.png',
                          action: () async {
                            if (_model.pageViewCurrentIndex == 2) {
                              context.goNamed('ChooseRolePage');
                            } else {
                              await _model.pageViewController?.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.onBoardingComponentModel2,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: OnBoardingComponentWidget(
                          title: FFLocalizations.of(context).getText(
                            'qnw2fiez' /* Оплата USDT  */,
                          ),
                          descitpion: FFLocalizations.of(context).getText(
                            'obyl3gat' /* Оплачивайте криптовалютой, быс... */,
                          ),
                          pageNumber: 2,
                          image:
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/geo-taxi-zosi7j/assets/dkmeaoz9qvnv/Frame_1061-2.png',
                          action: () async {
                            if (_model.pageViewCurrentIndex == 2) {
                              context.goNamed('ChooseRolePage');
                            } else {
                              await _model.pageViewController?.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.onBoardingComponentModel3,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: OnBoardingComponentWidget(
                          title: FFLocalizations.of(context).getText(
                            'd4hyh5er' /* Легкий заказ */,
                          ),
                          descitpion: FFLocalizations.of(context).getText(
                            'r1t620oo' /* Выберите машину и наслаждайтес... */,
                          ),
                          pageNumber: 3,
                          image:
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/geo-taxi-zosi7j/assets/wflnhyoyfity/Frame_1063-2.png',
                          action: () async {
                            if (_model.pageViewCurrentIndex == 2) {
                              context.goNamed('ChooseRolePage');
                            } else {
                              await _model.pageViewController?.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: smooth_page_indicator.SmoothPageIndicator(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      count: 3,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) async {
                        await _model.pageViewController!.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        safeSetState(() {});
                      },
                      effect: smooth_page_indicator.SlideEffect(
                        spacing: 4.0,
                        radius: 4.0,
                        dotWidth: 32.0,
                        dotHeight: 8.0,
                        dotColor: FlutterFlowTheme.of(context).accent1,
                        activeDotColor: FlutterFlowTheme.of(context).primary,
                        paintStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
