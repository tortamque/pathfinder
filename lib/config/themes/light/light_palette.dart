import 'package:flutter/material.dart';
import 'package:pathfinder/config/themes/app_colors.dart';

final lightColors = AppColors(
  brightness: Brightness.light,
  startCell: const Color(0xFF64FFDA),
  endCell: const Color(0xFF009688),
  blockedCell: const Color(0xFF000000),
  pathCell: const Color(0xFF4CAF50),
  emptyCell: const Color(0xFFFFFFFF),
);
