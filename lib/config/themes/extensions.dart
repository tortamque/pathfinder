import 'package:flutter/material.dart';
import 'package:pathfinder/config/themes/app_colors.dart';

extension AppColorsFromContext on BuildContext {
  AppColors get colors => AppColors.of(this);
}
