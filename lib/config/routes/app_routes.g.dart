// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $enterUrlRoute,
    ];

RouteBase get $enterUrlRoute => GoRouteData.$route(
      path: '/',
      factory: $EnterUrlRouteExtension._fromState,
    );

extension $EnterUrlRouteExtension on EnterUrlRoute {
  static EnterUrlRoute _fromState(GoRouterState state) => const EnterUrlRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
