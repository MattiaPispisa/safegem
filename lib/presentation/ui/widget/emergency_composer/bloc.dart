import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/injection.dart';

/// [BlocProvider] + [EmergencyComposerBloc]
class EmergencyComposerProvider extends StatelessWidget {
  /// constructor
  const EmergencyComposerProvider({
    required this.child,
    super.key,
  });

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EmergencyComposerBloc>(),
      child: child,
    );
  }
}

/// [BlocConsumer] + [EmergencyComposerBloc]
class EmergencyComposerConsumer extends StatelessWidget {
  /// constructor
  const EmergencyComposerConsumer({
    required this.builder,
    required this.listener,
    super.key,
  });

  /// builder
  final Widget Function(
    BuildContext context,
    EmergencyComposerState state,
  ) builder;

  /// listener
  final void Function(
    BuildContext,
    EmergencyComposerState,
  ) listener;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmergencyComposerBloc, EmergencyComposerState>(
      builder: builder,
      listener: listener,
    );
  }
}

/// [BlocSelector] + [EmergencyComposerBloc]
class EmergencyComposerSelector<T> extends StatelessWidget {
  /// constructor
  const EmergencyComposerSelector({
    required this.selector,
    required this.builder,
    super.key,
  });

  /// selector
  final T Function(
    EmergencyComposerState state,
  ) selector;

  /// builder
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

/// [BlocListener] + [EmergencyComposerBloc]
class EmergencyComposerListener extends StatelessWidget {
  /// constructor
  const EmergencyComposerListener({
    required this.listener,
    required this.child,
    super.key,
  });

  /// child
  final Widget child;

  /// listener
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
