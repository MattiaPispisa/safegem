import 'package:flutter/material.dart';

class AppSpacing extends ThemeExtension<AppSpacing> {
  const AppSpacing({this.unit = 8});

  final double unit;

  double get s => unit / 2;
  double get m => unit;
  double get l => unit * 2;

  double get between => unit * 2;

  @override
  ThemeExtension<AppSpacing> copyWith({
    double? unit,
  }) {
    return AppSpacing(unit: unit ?? this.unit);
  }

  @override
  AppSpacing lerp(
    covariant ThemeExtension<AppSpacing>? other,
    double t,
  ) {
    return this;
  }
}
