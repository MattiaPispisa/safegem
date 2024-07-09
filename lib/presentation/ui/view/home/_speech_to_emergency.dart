import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:safegem/application/application.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';

/// listen [SpeechRecognizerState.optionOrMessageRecognizedEnd].
/// If [Some]<[UserMessage]> then is used
/// to send a [EmergencyMessageSent] to [EmergencyComposerBloc]
class SpeechToRecognizer extends StatelessWidget {
  /// constructor
  const SpeechToRecognizer({required this.child, super.key});

  /// child
  final Widget child;

  void _listener(
    BuildContext context,
    SpeechRecognizerState state,
  ) {
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
