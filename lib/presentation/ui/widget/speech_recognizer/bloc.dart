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

  final Widget Function(
    BuildContext context,
    SpeechRecognizerState state,
  ) builder;
  final void Function(
    BuildContext context,
    SpeechRecognizerState state,
  ) listener;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpeechRecognizerBloc, SpeechRecognizerState>(
      builder: builder,
      listener: listener,
    );
  }
}

class SpeechRecognizerBuilder extends StatelessWidget {
  const SpeechRecognizerBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(
    BuildContext context,
    SpeechRecognizerState state,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechRecognizerBloc, SpeechRecognizerState>(
      builder: builder,
    );
  }
}

class SpeechRecognizerSelector<T> extends StatelessWidget {
  const SpeechRecognizerSelector({
    super.key,
    required this.selector,
    required this.builder,
  });

  final T Function(SpeechRecognizerState state) selector;
  final Widget Function(
    BuildContext context,
    T state,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SpeechRecognizerBloc, SpeechRecognizerState, T>(
      selector: selector,
      builder: builder,
    );
  }
}

class SpeechRecognizerIsListening extends StatelessWidget {
  const SpeechRecognizerIsListening({
    super.key,
    required this.builder,
  });

  final Widget Function(
    BuildContext context,
    bool isListening,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SpeechRecognizerBloc, SpeechRecognizerState, bool>(
      selector: (state) => state.isListening,
      builder: builder,
    );
  }
}

class SpeechRecognizerListener extends StatelessWidget {
  const SpeechRecognizerListener({
    super.key,
    required this.listener,
    this.listenWhen,
    required this.child,
  });

  final void Function(
    BuildContext context,
    SpeechRecognizerState state,
  ) listener;
  final bool Function(
    SpeechRecognizerState previous,
    SpeechRecognizerState current,
  )? listenWhen;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SpeechRecognizerBloc, SpeechRecognizerState>(
      listenWhen: listenWhen,
      listener: listener,
      child: child,
    );
  }
}

class SpeechRecognizerOnStartListening extends StatelessWidget {
  const SpeechRecognizerOnStartListening({
    super.key,
    required this.onListening,
    required this.child,
  });

  final void Function() onListening;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SpeechRecognizerListener(
      listener: (context, state) {
        onListening();
      },
      listenWhen: (previous, current) {
        return !previous.isListening && current.isListening;
      },
      child: child,
    );
  }
}
