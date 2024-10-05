import 'package:flutter/material.dart';
import 'package:pathfinder/app/app.dart';
import 'package:pathfinder/bootstrap.dart';
import 'package:pathfinder/config/config_model/dev/dev_config.dart';

void main() async {
  runApp(
    bootstrap(
      configModel: devConfig,
      child: const MainApp(),
    ),
  );
}
