import 'package:flutter/material.dart';
import 'package:pathfinder/config/themes/app_colors.dart';

ThemeData getTheme(AppColors colors) => ThemeData(
      useMaterial3: true,
      extensions: [colors],
      brightness: colors.brightness,
      colorSchemeSeed: colors.primary,
    );
