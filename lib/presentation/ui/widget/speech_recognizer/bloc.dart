import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/injection.dart';

/// [BlocProvider] with [SpeechRecognizerBloc]
class SpeechRecognizerProvider extends StatelessWidget {
  /// constructor
  const SpeechRecognizerProvider({
    required this.child,
    super.key,
  });

  /// child
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
  /// constructor
  const SpeechRecognizerConsumer({
    required this.builder,
    required this.listener,
    super.key,
  });

  /// builder
  final Widget Function(
    BuildContext context,
    SpeechRecognizerState state,
  ) builder;

  /// listener
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
  /// constructor
  const SpeechRecognizerBuilder({
    required this.builder,
    super.key,
  });

  /// builder
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
  /// constructor
  const SpeechRecognizerSelector({
    required this.selector,
    required this.builder,
    super.key,
  });

  /// selector
  final T Function(
    SpeechRecognizerState state,
  ) selector;

  /// builder
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
  /// constructor
  const SpeechRecognizerIsListening({
    required this.builder,
    super.key,
  });

  /// builder with [SpeechRecognizerState.isListening]
  final Widget Function(
    BuildContext context, {
    required bool isListening,
  }) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SpeechRecognizerBloc, SpeechRecognizerState, bool>(
      selector: (state) => state.isListening,
      builder: (context, isListening) => builder(
        context,
        isListening: isListening,
      ),
    );
  }
}

/// [BlocListener] with [SpeechRecognizerBloc]
class SpeechRecognizerListener extends StatelessWidget {
  /// constructor
  const SpeechRecognizerListener({
    required this.listener,
    required this.child,
    super.key,
    this.listenWhen,
  });

  /// listener
  final void Function(
    BuildContext context,
    SpeechRecognizerState state,
  ) listener;

  /// listen when
  final bool Function(
    SpeechRecognizerState previous,
    SpeechRecognizerState current,
  )? listenWhen;

  /// child
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

/// run [onListening] when [SpeechRecognizerState.isListening] change
class SpeechRecognizerOnStartListening extends StatelessWidget {
  /// constructor
  const SpeechRecognizerOnStartListening({
    required this.onListening,
    required this.child,
    super.key,
  });

  /// callback when [SpeechRecognizerState.isListening] change
  final void Function() onListening;

  /// child
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
