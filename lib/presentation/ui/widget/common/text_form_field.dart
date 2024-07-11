import 'package:flutter/material.dart';

/// Wrap around [TextFormField]
class AppTextFormField extends StatelessWidget {
  /// constructor
  const AppTextFormField({
    this.onChanged,
    this.initialValue,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.prefixIconData,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    super.key,
  });

  /// Called when the user initiates a change to the TextField's value:
  /// when they have inserted or deleted text or reset the form.
  final void Function(String text)? onChanged;

  /// initial value
  final String? initialValue;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// validator function
  final String? Function(String?)? validator;

  /// keyboard type
  final TextInputType? keyboardType;

  /// an icon displayed before text
  final IconData? prefixIconData;

  /// keyboard action to display
  final TextInputAction? textInputAction;

  /// focus node
  final FocusNode? focusNode;

  /// when [textInputAction] is pressed
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIconData != null
            ? Icon(
                prefixIconData,
                size: 18,
              )
            : null,
      ),
      autovalidateMode: AutovalidateMode.always,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
    );
  }
}
