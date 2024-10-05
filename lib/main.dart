import 'package:flutter/material.dart';
import 'package:pathfinder/config/routes/app_router.dart';
import 'package:pathfinder/config/routes/app_routes.dart';
import 'package:pathfinder/config/themes/light/light_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      routerConfig: router,
    );
  }
}

class TestRoute extends StatelessWidget {
  const TestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Test route")),
    );
  }
}
