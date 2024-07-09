import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

import 'package:safegem/presentation/ui/widget/widget.dart';

const _kButtonSize = 30.0;

/// A circular colored button
class SelectableColor extends StatelessWidget {
  /// constructor
  const SelectableColor({
    required this.selected,
    required this.color,
    required this.onTap,
    super.key,
  });

  /// selected
  final bool selected;

  /// color
  final MaterialColor color;

  /// on tap callback
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? context.theme().app.colors.neutral.shade900 : color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
            height: _kButtonSize,
            width: _kButtonSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
