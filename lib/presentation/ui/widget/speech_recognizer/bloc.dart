import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/injection.dart';

class SpeechRecognizerProvider extends StatelessWidget {
  const SpeechRecognizerProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SpeechRecognizerBloc>(),
      child: child,
    );
  }
}

class SpeechRecognizerConsumer extends StatelessWidget {
  const SpeechRecognizerConsumer({
    super.key,
    required this.builder,
    required this.listener,
  });

  final Widget Function(BuildContext context, SpeechRecognizerState state)
      builder;
  final void Function(BuildContext, SpeechRecognizerState) listener;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpeechRecognizerBloc, SpeechRecognizerState>(
      builder: builder,
      listener: listener,
    );
  }
}
