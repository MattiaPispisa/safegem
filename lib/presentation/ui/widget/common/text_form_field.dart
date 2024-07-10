import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    this.onChanged,
    this.initialValue,
    this.hintText,
    this.validator,
    this.keyboardType,
    super.key,
  });

  final void Function(String text)? onChanged;
  final String? initialValue;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardType,
    );
  }
}
