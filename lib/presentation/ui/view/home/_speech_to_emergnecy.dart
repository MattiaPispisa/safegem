import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/application.dart';
import '../../widget/widget.dart';

class SpeechToRecognizer extends StatelessWidget {
  const SpeechToRecognizer({super.key, required this.child});

  final Widget child;

  void _listener(BuildContext context, SpeechRecognizerState state) {
    final location = LocationHandler.of(context).lastKnowLocation;
    state.optionOrMessageRecognizedEnd.fold(
      () {},
      (userMessage) {
        context.read<EmergencyComposerBloc>().add(
              EmergencyMessageSent(
                message: userMessage,
                // TODO: gestione
                location: location!,
                senderContactInfo: null
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
