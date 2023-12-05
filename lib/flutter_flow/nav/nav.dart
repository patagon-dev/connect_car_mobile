import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => const LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => const LoginWidget(),
        ),
        FFRoute(
          name: 'car_crash_form',
          path: '/carCrashForm',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: CarCrashFormWidget(),
          ),
        ),
        FFRoute(
          name: 'profile_page',
          path: '/profile_page',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'profile_page')
              : const NavBarPage(
                  initialPage: 'profile_page',
                  page: ProfilePageWidget(),
                ),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'reset_password',
          path: '/resetPassword',
          builder: (context, params) => const ResetPasswordWidget(),
        ),
        FFRoute(
          name: 'reset_password_verification',
          path: '/resetPasswordVerification',
          builder: (context, params) => const ResetPasswordVerificationWidget(),
        ),
        FFRoute(
          name: 'suscripciones',
          path: '/suscripciones',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'suscripciones')
              : const NavBarPage(
                  initialPage: 'suscripciones',
                  page: SuscripcionesWidget(),
                ),
        ),
        FFRoute(
          name: 'suscripciones_details',
          path: '/suscripcionesDetails',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: SuscripcionesDetailsWidget(
              brand: params.getParam('brand', ParamType.String),
              model: params.getParam('model', ParamType.String),
              version: params.getParam('version', ParamType.String),
              image: params.getParam('image', ParamType.JSON),
              licensePlate: params.getParam('licensePlate', ParamType.String),
              subscriptionID:
                  params.getParam('subscriptionID', ParamType.String),
            ),
          ),
        ),
        FFRoute(
          name: 'schedule_maintenance',
          path: '/scheduleMaintenance',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ScheduleMaintenanceWidget(
              brand: params.getParam('brand', ParamType.String),
              model: params.getParam('model', ParamType.String),
              licensePlate: params.getParam('licensePlate', ParamType.String),
              version: params.getParam('version', ParamType.String),
              carimge: params.getParam('carimge', ParamType.JSON),
            ),
          ),
        ),
        FFRoute(
          name: 'maintenance_scheduling',
          path: '/maintenanceScheduling',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: MaintenanceSchedulingWidget(),
          ),
        ),
        FFRoute(
          name: 'roadside_assistance_page',
          path: '/roadsideAssistancePage',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: RoadsideAssistancePageWidget(),
          ),
        ),
        FFRoute(
          name: 'car_wash',
          path: '/carWash',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: CarWashWidget(),
          ),
        ),
        FFRoute(
          name: 'tire_change',
          path: '/tireChange',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: TireChangeWidget(),
          ),
        ),
        FFRoute(
          name: 'low_battery',
          path: '/lowBattery',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: LowBatteryWidget(),
          ),
        ),
        FFRoute(
          name: 'fuel_replacement',
          path: '/fuelReplacement',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: FuelReplacementWidget(),
          ),
        ),
        FFRoute(
          name: 'door_opening',
          path: '/doorOpening',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: DoorOpeningWidget(),
          ),
        ),
        FFRoute(
          name: 'other_unforeseen_events',
          path: '/otherUnforeseenEvents',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: OtherUnforeseenEventsWidget(),
          ),
        ),
        FFRoute(
          name: 'crane_service',
          path: '/craneService',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: CraneServiceWidget(),
          ),
        ),
        FFRoute(
          name: 'Light_mechanics',
          path: '/lightMechanics',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: LightMechanicsWidget(),
          ),
        ),
        FFRoute(
          name: 'LogInPage',
          path: '/logInPage',
          builder: (context, params) => const LogInPageWidget(),
        ),
        FFRoute(
          name: 'ResetPage',
          path: '/resetPage',
          builder: (context, params) => const ResetPageWidget(),
        ),
        FFRoute(
          name: 'ResetPasswordSuccess',
          path: '/resetPasswordSuccess',
          builder: (context, params) => const ResetPasswordSuccessWidget(),
        ),
        FFRoute(
          name: 'car_crash_formCopy',
          path: '/carCrashFormCopy',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: CarCrashFormCopyWidget(),
          ),
        ),
        FFRoute(
          name: 'test',
          path: '/test',
          builder: (context, params) => const TestWidget(),
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

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
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
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
