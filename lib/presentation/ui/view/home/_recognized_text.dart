import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RecognizedText extends StatelessWidget {
  const RecognizedText({super.key});

  @override
  Widget build(BuildContext context) {
    return EmergencyComposerSelector(
      selector: (state) => state.composingMessage,
      builder: (_, composingMessage) {
        return SpeechRecognizerSelector(
          selector: (state) => state.recognizedWords,
          builder: (__, recognizedWords) {
            if (composingMessage) {
              return _ComposingRecognizedWords(
                  recognizedWords: recognizedWords);
            }

            return _TextUnderRecognition(
              recognizedWords: recognizedWords,
            );
          },
        );
      },
    );
  }
}

class _ComposingRecognizedWords extends StatelessWidget {
  const _ComposingRecognizedWords({
    super.key,
    required this.recognizedWords,
  });

  final String recognizedWords;

  @override
  Widget build(BuildContext context) {
    return _UserText(recognizedWords)
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1200.ms, color: Colors.grey)
        .animate();
  }
}

class _TextUnderRecognition extends StatelessWidget {
  const _TextUnderRecognition({
    super.key,
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
      ),
    );
  }
}
