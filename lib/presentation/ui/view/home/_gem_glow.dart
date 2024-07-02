import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import '../../widget/widget.dart';

// TODO: togliere costanti

class BlocGemGlow extends StatelessWidget {
  void _onTap(BuildContext context) {
    context.read<SpeechRecognizerBloc>().add(SpeechRecognizerToggledSpeech());
  }

  @override
  Widget build(BuildContext context) {
    return SpeechRecognizerSelector(
      selector: (state) => state.isListening,
      builder: (_, isListening) {
        return GemGlow(
          animated: isListening,
          onTap: () => _onTap(context),
        );
      },
    );
  }
}

class GemGlow extends StatelessWidget {
  const GemGlow({
    super.key,
    required this.animated,
    required this.onTap,
  });

  final VoidCallback onTap;
  final bool animated;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();

    return AvatarGlow(
      repeat: true,
      glowColor: theme.primaryColor,
      glowShape: BoxShape.circle,
      animate: animated,
      glowRadiusFactor: 0.6,
      curve: Curves.fastOutSlowIn,
      child: InkWell(
        borderRadius: BorderRadius.circular(60),
        onTap: onTap,
        child: Ink(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.gem,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
