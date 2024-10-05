import 'package:flutter/material.dart';
import 'package:pathfinder/config/themes/app_colors.dart';

extension AppColorsFromContext on BuildContext {
  AppColors get colors => AppColors.of(this);
}

extension TextStylesFromContext on BuildContext {
  TextTheme get textStyles => Theme.of(this).textTheme;
}

extension CustomTextStyle on TextTheme {
  TextStyle get regular => const TextStyle(
        fontSize: 16,
      );
}
