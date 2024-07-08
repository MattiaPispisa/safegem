import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

import 'package:safegem/presentation/ui/widget/widget.dart';

class SelectableColor extends StatelessWidget {
  const SelectableColor({
    required this.selected, required this.color, required this.onTap, super.key,
  });

  final bool selected;
  final MaterialColor color;
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
            height: 30,
            width: 30,
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
