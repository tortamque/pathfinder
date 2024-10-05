// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $problemSolvingRoute,
      $resultsPreviewRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $problemSolvingRoute => GoRouteData.$route(
      path: '/problem-solving',
      factory: $ProblemSolvingRouteExtension._fromState,
    );

extension $ProblemSolvingRouteExtension on ProblemSolvingRoute {
  static ProblemSolvingRoute _fromState(GoRouterState state) =>
      const ProblemSolvingRoute();

  String get location => GoRouteData.$location(
        '/problem-solving',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $resultsPreviewRoute => GoRouteData.$route(
      path: '/results-preview',
      factory: $ResultsPreviewRouteExtension._fromState,
    );

extension $ResultsPreviewRouteExtension on ResultsPreviewRoute {
  static ResultsPreviewRoute _fromState(GoRouterState state) =>
      ResultsPreviewRoute(
        $extra: state.extra as List<SolvedMazeModel>,
      );

  String get location => GoRouteData.$location(
        '/results-preview',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
