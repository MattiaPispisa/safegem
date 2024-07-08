import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/injection.dart';

class SenderBlocProvider extends StatelessWidget {
  const SenderBlocProvider({
    required this.child, super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SenderBloc>(),
      child: child,
    );
  }
}

class SenderConsumer extends StatelessWidget {
  const SenderConsumer({
    required this.builder, required this.listener, super.key,
  });

  final Widget Function(BuildContext context, SenderState state) builder;
  final void Function(BuildContext, SenderState) listener;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SenderBloc, SenderState>(
      builder: builder,
      listener: listener,
    );
  }
}

class SenderBuilder extends StatelessWidget {
  const SenderBuilder({
    required this.builder, super.key,
  });

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

class SenderOnNewMessage extends StatelessWidget {
  const SenderOnNewMessage({
    required this.onMessage, required this.child, super.key,
  });

  final void Function(EmergencyMessage message) onMessage;
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
