import 'dart:math' as math;

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';

/// Using [SpeechRecognizerState.isListening] animate the [GemGlow].
///
/// On tap call [SpeechRecognizerToggledSpeech]
class BlocGemGlow extends StatelessWidget {
  /// constructor
  const BlocGemGlow({super.key});

  void _onTap(BuildContext context) {
    context.read<SpeechRecognizerBloc>().add(SpeechRecognizerToggledSpeech());
  }

  @override
  Widget build(BuildContext context) {
    return SpeechRecognizerSelector(
      selector: (state) => (state.isListening, state.isAvailable),
      builder: (_, state) {
        final (isListening, isAvailable) = state;
        return GemGlow(
          animated: isListening,
          onTap: isAvailable ? () => _onTap(context) : null,
        );
      },
    );
  }
}

/// An animated avatar used to indicate when the application is listening.
class GemGlow extends StatelessWidget {
  /// constructor
  const GemGlow({
    required this.animated,
    required this.onTap,
    super.key,
  });

  /// on tap callback
  final VoidCallback? onTap;

  /// if is to animate
  final bool animated;

  bool get _disabled => onTap == null;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();

    return AvatarGlow(
      glowColor:
          _disabled ? theme.app.colors.neutral.shade300 : theme.primaryColor,
      animate: animated,
      glowRadiusFactor: 0.6,
      child: _gem(context),
    );
  }

  Widget _gem(BuildContext context) {
    final theme = context.theme();
    final size = MediaQuery.sizeOf(context);
    final sizeSize = math.min(size.width, size.height) / 3;

    return InkWell(
      borderRadius: BorderRadius.circular(sizeSize / 2),
      onTap: onTap,
      child: Ink(
        height: sizeSize,
        width: sizeSize,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            FontAwesomeIcons.gem,
            size: sizeSize / 3,
            color: context.theme().colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
