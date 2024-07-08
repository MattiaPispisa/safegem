import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:safegem/application/application.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';

class SpeechToRecognizer extends StatelessWidget {
  const SpeechToRecognizer({required this.child, super.key});

  final Widget child;

  void _listener(BuildContext context, SpeechRecognizerState state) {
    final location = LocationHandler.of(context).lastKnowLocation.value;

    if (location == null) {
      return;
    }

    state.optionOrMessageRecognizedEnd.fold(
      () {},
      (userMessage) {
        context.read<EmergencyComposerBloc>().add(
              EmergencyMessageSent(
                message: userMessage,
                location: location,
                senderContactInfo: null,
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SpeechRecognizerListener(
      listener: _listener,
      child: child,
    );
  }
}
