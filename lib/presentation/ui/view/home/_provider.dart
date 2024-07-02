import 'package:flutter/material.dart';
import '../../widget/widget.dart';

class HomeProviders extends StatelessWidget {
  const HomeProviders({
    super.key,
    required this.child,
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
