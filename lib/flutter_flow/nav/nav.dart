import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomePageWidget() : const LanguagePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const HomePageWidget()
              : const LanguagePageWidget(),
        ),
        FFRoute(
          name: 'OnboardingPage',
          path: '/onboardingPage',
          builder: (context, params) => const OnboardingPageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'LanguagePage',
          path: '/languagePage',
          builder: (context, params) => const LanguagePageWidget(),
        ),
        FFRoute(
          name: 'ChooseRolePage',
          path: '/chooseRolePage',
          builder: (context, params) => const ChooseRolePageWidget(),
        ),
        FFRoute(
          name: 'RegistrationPage',
          path: '/registrationPage',
          builder: (context, params) => RegistrationPageWidget(
            role: params.getParam(
              'role',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'ConfirmEmailPage',
          path: '/confirmEmailPage',
          builder: (context, params) => ConfirmEmailPageWidget(
            role: params.getParam(
              'role',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'RegistrationTwoPage',
          path: '/registrationTwoPage',
          builder: (context, params) => RegistrationTwoPageWidget(
            role: params.getParam(
              'role',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'RegistrationThreePage',
          path: '/registrationThreePage',
          builder: (context, params) => const RegistrationThreePageWidget(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'Client8',
          path: '/client8',
          builder: (context, params) => Client8Widget(
            ride: params.getParam(
              'ride',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['rides'],
            ),
            driver: params.getParam(
              'driver',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'ChatPage',
          path: '/chatPage',
          builder: (context, params) => ChatPageWidget(
            userChat: params.getParam(
              'userChat',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            ride: params.getParam(
              'ride',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['rides'],
            ),
          ),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          builder: (context, params) => const ProfilePageWidget(),
        ),
        FFRoute(
          name: 'HistoryPage',
          path: '/historyPage',
          builder: (context, params) => const HistoryPageWidget(),
        ),
        FFRoute(
          name: 'BalancePage',
          path: '/balancePage',
          builder: (context, params) => const BalancePageWidget(),
        ),
        FFRoute(
          name: 'FundRequestPage',
          path: '/fundRequestPage',
          builder: (context, params) => const FundRequestPageWidget(),
        ),
        FFRoute(
          name: 'FaqPage',
          path: '/faqPage',
          builder: (context, params) => const FaqPageWidget(),
        ),
        FFRoute(
          name: 'FaqDetailPage',
          path: '/faqDetailPage',
          builder: (context, params) => const FaqDetailPageWidget(),
        ),
        FFRoute(
          name: 'CarAccidentPage',
          path: '/carAccidentPage',
          builder: (context, params) => const CarAccidentPageWidget(),
        ),
        FFRoute(
          name: 'SupportPage',
          path: '/supportPage',
          builder: (context, params) => const SupportPageWidget(),
        ),
        FFRoute(
          name: 'NotificationsPage',
          path: '/notificationsPage',
          builder: (context, params) => const NotificationsPageWidget(),
        ),
        FFRoute(
          name: 'HistoryDetailPage',
          path: '/historyDetailPage',
          asyncParams: {
            'ride': getDoc(['rides'], RidesRecord.fromSnapshot),
          },
          builder: (context, params) => HistoryDetailPageWidget(
            ride: params.getParam(
              'ride',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'SupportChat',
          path: '/supportChat',
          builder: (context, params) => const SupportChatWidget(),
        ),
        FFRoute(
          name: 'FaqQuestionPage',
          path: '/faqQuestionPage',
          builder: (context, params) => FaqQuestionPageWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Client1',
          path: '/client1',
          asyncParams: {
            'newRide': getDoc(['rides'], RidesRecord.fromSnapshot),
          },
          builder: (context, params) => Client1Widget(
            newRide: params.getParam(
              'newRide',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Client2',
          path: '/client2',
          builder: (context, params) => Client2Widget(
            findingDriver: params.getParam(
              'findingDriver',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['rides'],
            ),
          ),
        ),
        FFRoute(
          name: 'Client3',
          path: '/client3',
          builder: (context, params) => Client3Widget(
            foundDriver: params.getParam(
              'foundDriver',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['rides'],
            ),
          ),
        ),
        FFRoute(
          name: 'Client5',
          path: '/client5',
          builder: (context, params) => Client5Widget(
            ridePayment: params.getParam(
              'ridePayment',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['rides'],
            ),
          ),
        ),
        FFRoute(
          name: 'Client6',
          path: '/client6',
          asyncParams: {
            'rideFinished': getDoc(['rides'], RidesRecord.fromSnapshot),
          },
          builder: (context, params) => Client6Widget(
            rideFinished: params.getParam(
              'rideFinished',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Client7',
          path: '/client7',
          builder: (context, params) => Client7Widget(
            notFound: params.getParam(
              'notFound',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['rides'],
            ),
          ),
        ),
        FFRoute(
          name: 'Driver1',
          path: '/driver1',
          builder: (context, params) => const Driver1Widget(),
        ),
        FFRoute(
          name: 'Driver2',
          path: '/driver2',
          asyncParams: {
            'foundRide': getDoc(['rides'], RidesRecord.fromSnapshot),
          },
          builder: (context, params) => Driver2Widget(
            foundRide: params.getParam(
              'foundRide',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Driver3',
          path: '/driver3',
          asyncParams: {
            'foundRide': getDoc(['rides'], RidesRecord.fromSnapshot),
          },
          builder: (context, params) => Driver3Widget(
            foundRide: params.getParam(
              'foundRide',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Driver6',
          path: '/driver6',
          asyncParams: {
            'foundRide': getDoc(['rides'], RidesRecord.fromSnapshot),
          },
          builder: (context, params) => Driver6Widget(
            foundRide: params.getParam(
              'foundRide',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Driver4',
          path: '/driver4',
          builder: (context, params) => Driver4Widget(
            foundRide: params.getParam(
              'foundRide',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['rides'],
            ),
          ),
        ),
        FFRoute(
          name: 'Driver5',
          path: '/driver5',
          builder: (context, params) => Driver5Widget(
            foundRide: params.getParam(
              'foundRide',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['rides'],
            ),
          ),
        ),
        FFRoute(
          name: 'Client4',
          path: '/client4',
          builder: (context, params) => Client4Widget(
            foundDriver: params.getParam(
              'foundDriver',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['rides'],
            ),
          ),
        ),
        FFRoute(
          name: 'ProfileEditPage',
          path: '/profileEditPage',
          builder: (context, params) => const ProfileEditPageWidget(),
        ),
        FFRoute(
          name: 'SupportRequestsPage',
          path: '/supportRequestsPage',
          builder: (context, params) => const SupportRequestsPageWidget(),
        ),
        FFRoute(
          name: 'SupportRequestsPageCopy',
          path: '/supportRequestsPageCopy',
          builder: (context, params) => const SupportRequestsPageCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/languagePage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Splash.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
