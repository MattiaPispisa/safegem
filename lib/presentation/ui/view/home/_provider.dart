import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';

class HomeProviders extends StatelessWidget {
  const HomeProviders({
    required this.child, super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EmergencyComposerProvider(
      child: SpeechRecognizerProvider(
        child: SenderBlocProvider(
          child: child,
        ),
      ),
    );
  }
}
