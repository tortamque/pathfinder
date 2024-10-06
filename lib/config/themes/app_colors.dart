import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Brightness brightness;
  final Color primary;
  final Color secondary;

  AppColors({
    required this.brightness,
    required this.primary,
    required this.secondary,
  });

  factory AppColors.of(BuildContext context) => Theme.of(context).extension<AppColors>()!;

  @override
  AppColors copyWith({
    Brightness? brightness,
    Color? primary,
    Color? secondary,
  }) {
    return AppColors(
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other == null) return this;
    if (other is! AppColors) return this;

    return AppColors(
      brightness: brightness,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
    );
  }
}
