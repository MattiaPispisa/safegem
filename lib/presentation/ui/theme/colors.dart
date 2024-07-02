import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.warning,
  });

  factory AppColors.light() {
    return AppColors(warning: Colors.amber);
  }

  final Color warning;

  @override
  ThemeExtension<AppColors> copyWith({
    Color? warning,
  }) {
    return AppColors(warning: warning ?? this.warning);
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      warning: _lerpOrCurrent(warning, other.warning, t),
    );
  }

  Color _lerpOrCurrent(Color current, Color other, double t) {
    return Color.lerp(current, other, t) ?? current;
  }
}
