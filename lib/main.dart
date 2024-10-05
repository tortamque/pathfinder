import 'package:flutter/material.dart';
import 'package:pathfinder/config/themes/light/light_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: Scaffold(
        body: Center(child: const Text("Hello world!")),
      ),
    );
  }
}
