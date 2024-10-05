import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder/main.dart';

part 'app_routes.g.dart';

@TypedGoRoute<EnterUrlRoute>(path: '/')
final class EnterUrlRoute extends GoRouteData {
  const EnterUrlRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TestRoute();
  }
}
