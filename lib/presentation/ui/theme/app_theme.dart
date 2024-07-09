import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/theme/colors.dart';
import 'package:safegem/presentation/ui/theme/spacing.dart';

/// Theme extension for application
///
/// Contains:
/// - [AppColors] colors
/// - [AppSpacing] spacing
class AppTheme extends ThemeExtension<AppTheme> {
  /// constructor
  const AppTheme({
    required this.colors,
    required this.spacing,
  });

  /// [AppTheme] light version
  factory AppTheme.light() {
    return AppTheme(
      colors: AppColors.light(),
      spacing: const AppSpacing(),
    );
  }

  /// [AppTheme] dark version
  factory AppTheme.dark() {
    return AppTheme(
      colors: AppColors.dark(),
      spacing: const AppSpacing(),
    );
  }

  /// colors
  final AppColors colors;

  /// spacing
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
