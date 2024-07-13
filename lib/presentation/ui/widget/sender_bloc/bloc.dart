import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/injection.dart';

/// [BlocProvider] + [SenderBloc]
class SenderBlocProvider extends StatelessWidget {
  /// constructor
  const SenderBlocProvider({
    required this.child,
    super.key,
  });

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SenderBloc>(),
      child: child,
    );
  }
}

/// [BlocConsumer] + [SenderBloc]
class SenderConsumer extends StatelessWidget {
  /// constructor
  const SenderConsumer({
    required this.builder,
    required this.listener,
    super.key,
  });

  /// builder
  final Widget Function(
    BuildContext context,
    SenderState state,
  ) builder;

  /// listener
  final void Function(
    BuildContext context,
    SenderState state,
  ) listener;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SenderBloc, SenderState>(
      builder: builder,
      listener: listener,
    );
  }
}

/// [BlocBuilder] + [SenderBloc]
class SenderBuilder extends StatelessWidget {
  /// constructor
  const SenderBuilder({
    required this.builder,
    super.key,
  });

  /// builder
  final Widget Function(
    BuildContext context,
    SenderState state,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SenderBloc, SenderState>(
      builder: builder,
    );
  }
}

/// [BlocListener] + [SenderBloc]
///
/// [onMessage] is called when a different message is sent
/// (prev [SenderState.emergencyMessage] !=
/// current [SenderState.emergencyMessage])
class SenderOnNewMessage extends StatelessWidget {
  /// constructor
  const SenderOnNewMessage({
    required this.onMessage,
    required this.child,
    super.key,
  });

  /// callback on new message sent
  final void Function(EmergencyMessage message) onMessage;

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SenderBloc, SenderState>(
      listener: (context, state) {
        state.emergencyMessage.fold(() {}, onMessage);
      },
      listenWhen: (previous, current) {
        return previous.emergencyMessage != current.emergencyMessage;
      },
      child: child,
    );
  }
}
