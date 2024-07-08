import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.warning,
    required this.neutral,
  });

  factory AppColors.light() {
    return const AppColors(
      warning: Colors.amber,
      neutral: MaterialColor(
        0xFF6D6D6D,
        <int, Color>{
          50: Color(0xFFf7f7f7),
          100: Color(0xFFEBEBEB),
          200: Color(0xFFDADADA),
          300: Color(0xFFC8C8C8),
          400: Color(0xFFABABAB),
          500: Color(0xFF898989),
          600: Color(0xFF6D6D6D),
          700: Color(0xFF4D4D4D),
          800: Color(0xFF303030),
          900: Color(0xFF0F0F0F),
        },
      ),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      warning: Colors.amber,
      neutral: MaterialColor(
        0xFFABABAB,
        <int, Color>{
          900: Color(0xFFf7f7f7),
          800: Color(0xFFEBEBEB),
          700: Color(0xFFDADADA),
          600: Color(0xFFC8C8C8),
          500: Color(0xFFABABAB),
          400: Color(0xFF898989),
          300: Color(0xFF6D6D6D),
          200: Color(0xFF4D4D4D),
          100: Color(0xFF303030),
          50: Color(0xFF0F0F0F),
        },
      ),
    );
  }

  final MaterialColor warning;
  final MaterialColor neutral;

  @override
  ThemeExtension<AppColors> copyWith({
    MaterialColor? warning,
    MaterialColor? neutral,
  }) {
    return AppColors(
      warning: warning ?? this.warning,
      neutral: neutral ?? this.neutral,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      warning: _lerpMaterialColor(warning, other.warning, t),
      neutral: _lerpMaterialColor(neutral, other.neutral, t),
    );
  }

  MaterialColor _lerpMaterialColor(
    MaterialColor a,
    MaterialColor? b,
    double t,
  ) {
    return MaterialColor(
      _lerpOrCurrent(a, b, t).value,
      <int, Color>{
        50: _lerpOrCurrent(a.shade50, b?.shade50, t),
        100: _lerpOrCurrent(a.shade100, b?.shade100, t),
        200: _lerpOrCurrent(a.shade200, b?.shade200, t),
        300: _lerpOrCurrent(a.shade300, b?.shade300, t),
        400: _lerpOrCurrent(a.shade400, b?.shade400, t),
        500: _lerpOrCurrent(a.shade500, b?.shade500, t),
        600: _lerpOrCurrent(a.shade600, b?.shade600, t),
        700: _lerpOrCurrent(a.shade700, b?.shade700, t),
        800: _lerpOrCurrent(a.shade800, b?.shade800, t),
        900: _lerpOrCurrent(a.shade900, b?.shade900, t),
      },
    );
  }

  Color _lerpOrCurrent(Color current, Color? other, double t) {
    return Color.lerp(current, other, t) ?? current;
  }
}
