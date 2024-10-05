import 'package:flutter/material.dart';
import 'package:pathfinder/config/routes/app_router.dart';
import 'package:pathfinder/config/themes/light/light_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerConfig: router,
    );
  }
}
