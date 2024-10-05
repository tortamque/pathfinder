import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder/features/enter_url/presentation/pages/enter_url_page.dart';

part 'app_routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
final class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
