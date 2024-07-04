import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

class SelectableColor extends StatelessWidget {
  const SelectableColor({
    super.key,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  final bool selected;
  final MaterialColor color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? context.theme().app.colors.neutral.shade900 : color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
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
