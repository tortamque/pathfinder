import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Brightness brightness;
  final Color startCell;
  final Color endCell;
  final Color blockedCell;
  final Color pathCell;
  final Color emptyCell;
  final Color primary;

  AppColors({
    required this.brightness,
    required this.startCell,
    required this.endCell,
    required this.blockedCell,
    required this.pathCell,
    required this.emptyCell,
    required this.primary,
  });

  factory AppColors.of(BuildContext context) => Theme.of(context).extension<AppColors>()!;

  @override
  AppColors copyWith({
    Brightness? brightness,
    Color? startCell,
    Color? endCell,
    Color? blockedCell,
    Color? pathCell,
    Color? emptyCell,
    Color? primary,
  }) {
    return AppColors(
      brightness: brightness ?? this.brightness,
      startCell: startCell ?? this.startCell,
      endCell: endCell ?? this.endCell,
      blockedCell: blockedCell ?? this.blockedCell,
      pathCell: pathCell ?? this.pathCell,
      emptyCell: emptyCell ?? this.emptyCell,
      primary: primary ?? this.primary,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other == null) return this;
    if (other is! AppColors) return this;

    return AppColors(
      brightness: brightness,
      startCell: Color.lerp(startCell, other.startCell, t)!,
      endCell: Color.lerp(endCell, other.endCell, t)!,
      blockedCell: Color.lerp(blockedCell, other.blockedCell, t)!,
      pathCell: Color.lerp(pathCell, other.pathCell, t)!,
      emptyCell: Color.lerp(emptyCell, other.emptyCell, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
    );
  }
}
