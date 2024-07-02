import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/theme/colors.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({
    required this.colors,
  });

  factory AppTheme.light() {
    return AppTheme(
      colors: AppColors.light(),
    );
  }

  final AppColors colors;

  @override
  ThemeExtension<AppTheme> copyWith({AppColors? colors}) {
    return AppTheme(
      colors: colors ?? this.colors,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme(colors: colors.lerp(other.colors, t));
  }
}
