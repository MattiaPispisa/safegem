import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';

/// Listen [EmergencyComposerState.optionFailureOrMessageCreated].
/// If [Some]<[EmergencyMessage]>
/// then a [SenderMessageSent] is sent to [SenderBloc]
class EmergencyListener extends StatelessWidget {
  /// constructor
  const EmergencyListener({
    required this.child,
    super.key,
  });

  /// child
  final Widget child;

  void _listener(BuildContext context, EmergencyComposerState state) {
    state.optionFailureOrMessageCreated.fold(
      () {},
      (failureOrMessageCreated) {
        failureOrMessageCreated.fold(
          (failure) {},
          (messageCreated) {
            context.read<SenderBloc>().add(
                  SenderMessageSent(
                    emergencyMessage: messageCreated,
                  ),
                );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return EmergencyComposerListener(
      listener: _listener,
      child: child,
    );
  }
}
