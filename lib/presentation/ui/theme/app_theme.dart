import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/theme/colors.dart';
import 'package:safegem/presentation/ui/theme/spacing.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({
    required this.colors,
    required this.spacing,
  });

  factory AppTheme.light() {
    return AppTheme(
      colors: AppColors.light(),
      spacing: AppSpacing(),
    );
  }

  factory AppTheme.dark() {
    return AppTheme(
      colors: AppColors.dark(),
      spacing: AppSpacing(),
    );
  }

  final AppColors colors;
  final AppSpacing spacing;

  @override
  ThemeExtension<AppTheme> copyWith({AppColors? colors, AppSpacing? spacing}) {
    return AppTheme(
      colors: colors ?? this.colors,
      spacing: spacing ?? this.spacing,
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

    return AppTheme(
      colors: colors.lerp(other.colors, t),
      spacing: spacing.lerp(other.spacing, t),
    );
  }
}
