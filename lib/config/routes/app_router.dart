import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder/config/routes/app_routes.dart';

final rootKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootKey,
  routes: $appRoutes,
  debugLogDiagnostics: kDebugMode,
);
