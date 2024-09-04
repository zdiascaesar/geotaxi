import '/flutter_flow/flutter_flow_util.dart';
import '/pages/on_boarding_component/on_boarding_component_widget.dart';
import 'onboarding_page_widget.dart' show OnboardingPageWidget;
import 'package:flutter/material.dart';

class OnboardingPageModel extends FlutterFlowModel<OnboardingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for OnBoardingComponent component.
  late OnBoardingComponentModel onBoardingComponentModel1;
  // Model for OnBoardingComponent component.
  late OnBoardingComponentModel onBoardingComponentModel2;
  // Model for OnBoardingComponent component.
  late OnBoardingComponentModel onBoardingComponentModel3;

  @override
  void initState(BuildContext context) {
    onBoardingComponentModel1 =
        createModel(context, () => OnBoardingComponentModel());
    onBoardingComponentModel2 =
        createModel(context, () => OnBoardingComponentModel());
    onBoardingComponentModel3 =
        createModel(context, () => OnBoardingComponentModel());
  }

  @override
  void dispose() {
    onBoardingComponentModel1.dispose();
    onBoardingComponentModel2.dispose();
    onBoardingComponentModel3.dispose();
  }
}
