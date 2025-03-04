import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';

/// Using [EmergencyComposerState.composingMessage] and [SpeechRecognizerState]
/// return the [RecognizedText].
///
/// More info about text on [RecognizedText]
class BlocRecognizedText extends StatelessWidget {
  /// constructor
  const BlocRecognizedText({super.key});

  @override
  Widget build(BuildContext context) {
    return EmergencyComposerSelector(
      selector: (state) => state.composingMessage,
      builder: (context, composingMessage) {
        return SpeechRecognizerBuilder(
          builder: (context, state) {
            return RecognizedText(
              composingMessage: composingMessage,
              listening: state.isListening,
              recognizedWords: state.recognizedWords,
            );
          },
        );
      },
    );
  }
}

/// - if is listening text is animated;
/// - if is computing the emergency message then a shimmer effect is created;
/// - else a static text is displayed
class RecognizedText extends StatelessWidget {
  /// constructor
  const RecognizedText({
    required this.composingMessage,
    required this.listening,
    required this.recognizedWords,
    super.key,
  });

  /// is composing message
  final bool composingMessage;

  /// is listening speech
  final bool listening;

  /// current recognized words
  final String recognizedWords;

  @override
  Widget build(BuildContext context) {
    if (composingMessage) {
      return _ComposingRecognizedWords(recognizedWords: recognizedWords);
    }

    if (listening) {
      return _TextUnderRecognition(
        recognizedWords: recognizedWords,
      );
    }

    return _UserText(recognizedWords);
  }
}

class _ComposingRecognizedWords extends StatelessWidget {
  const _ComposingRecognizedWords({
    required this.recognizedWords,
  });

  final String recognizedWords;

  @override
  Widget build(BuildContext context) {
    return _UserText(recognizedWords)
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(
          duration: 1200.ms,
          color: context.appTheme().colors.neutral.shade200,
        )
        .animate();
  }
}

class _TextUnderRecognition extends StatelessWidget {
  const _TextUnderRecognition({
    required this.recognizedWords,
  });

  final String recognizedWords;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      child: _UserText(
        recognizedWords,
        key: ValueKey(recognizedWords),
      ),
    );
  }
}

class _UserText extends StatelessWidget {
  const _UserText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.theme().textTheme.headlineSmall,
      ),
    );
  }
}
