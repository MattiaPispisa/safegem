import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/injection.dart';

class EmergencyComposerProvider extends StatelessWidget {
  const EmergencyComposerProvider({
    super.key,
    required this.child,
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
    super.key,
    required this.builder,
    required this.listener,
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
