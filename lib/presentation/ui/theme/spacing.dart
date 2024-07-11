import 'package:flutter/material.dart';

/// Application spacing
class AppSpacing extends ThemeExtension<AppSpacing> {
  /// constructor
  const AppSpacing({
    this.unit = 8,
  });

  /// unit (default **8**)
  final double unit;

  /// unit / 2 (default **4**)
  double get s => unit / 2;

  /// unit (default **8**)
  double get m => unit;

  /// unit * 2 (default **16**)
  double get l => unit * 2;

  /// unit * 2 (default **16*+)
  double get between => unit * 2;

  /// unit * 2 (default **16*+)
  double get horizontal => unit * 2;

  /// unit * 6 (default **48*+)
  double get beforeAction => unit * 6;

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
