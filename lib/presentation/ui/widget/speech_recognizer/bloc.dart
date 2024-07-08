import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/injection.dart';

/// [BlocProvider] with [SpeechRecognizerBloc]
class SpeechRecognizerProvider extends StatelessWidget {
  const SpeechRecognizerProvider({
    required this.child, super.key,
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

/// [BlocConsumer] with [SpeechRecognizerBloc]
class SpeechRecognizerConsumer extends StatelessWidget {
  const SpeechRecognizerConsumer({
    required this.builder, required this.listener, super.key,
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

/// [BlocBuilder] with [SpeechRecognizerBloc]
class SpeechRecognizerBuilder extends StatelessWidget {
  const SpeechRecognizerBuilder({
    required this.builder, super.key,
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

/// [BlocSelector] with [SpeechRecognizerBloc]
class SpeechRecognizerSelector<T> extends StatelessWidget {
  const SpeechRecognizerSelector({
    required this.selector, required this.builder, super.key,
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

/// [builder] with [SpeechRecognizerState.isListening]
class SpeechRecognizerIsListening extends StatelessWidget {
  const SpeechRecognizerIsListening({
    required this.builder, super.key,
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

/// [BlocListener] with [SpeechRecognizerBloc]
class SpeechRecognizerListener extends StatelessWidget {
  const SpeechRecognizerListener({
    required this.listener, required this.child, super.key,
    this.listenWhen,
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

/// run [onListening] on [SpeechRecognizerState.isListening] change
class SpeechRecognizerOnStartListening extends StatelessWidget {
  const SpeechRecognizerOnStartListening({
    required this.onListening, required this.child, super.key,
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
