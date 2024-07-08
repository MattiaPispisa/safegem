import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/injection.dart';

class EmergencyComposerProvider extends StatelessWidget {
  const EmergencyComposerProvider({
    required this.child, super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EmergencyComposerBloc>(),
      child: child,
    );
  }
}

class EmergencyComposerConsumer extends StatelessWidget {
  const EmergencyComposerConsumer({
    required this.builder, required this.listener, super.key,
  });

  final Widget Function(BuildContext context, EmergencyComposerState state)
      builder;
  final void Function(BuildContext, EmergencyComposerState) listener;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmergencyComposerBloc, EmergencyComposerState>(
      builder: builder,
      listener: listener,
    );
  }
}

class EmergencyComposerSelector<T> extends StatelessWidget {
  const EmergencyComposerSelector({
    required this.selector, required this.builder, super.key,
  });

  final T Function(EmergencyComposerState state) selector;
  final Widget Function(
    BuildContext context,
    T state,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EmergencyComposerBloc, EmergencyComposerState, T>(
      selector: selector,
      builder: builder,
    );
  }
}

class EmergencyComposerListener extends StatelessWidget {
  const EmergencyComposerListener({
    required this.listener, required this.child, super.key,
  });

  final Widget child;
  final void Function(
    BuildContext context,
    EmergencyComposerState state,
  ) listener;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmergencyComposerBloc, EmergencyComposerState>(
      listener: listener,
      child: child,
    );
  }
}
