import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';

/// Provide every bloc required from the home page:
/// - [EmergencyComposerProvider]
/// - [SpeechRecognizerProvider]
/// - [SenderBlocProvider]
class HomeProviders extends StatelessWidget {
  /// constructor
  const HomeProviders({
    required this.child, super.key,
  });

  /// child
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
