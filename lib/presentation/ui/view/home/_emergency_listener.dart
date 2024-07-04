import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/application/emergency_composer/emergency_composer_bloc.dart';

import '../../widget/widget.dart';

class EmergencyListener extends StatelessWidget {
  const EmergencyListener({
    super.key,
    required this.child,
  });

  final Widget child;

  void _listener(BuildContext context, EmergencyComposerState state) {
    print("AAAA ${state.optionFailureOrMessageCreated}");

    state.optionFailureOrMessageCreated.fold(
      () {},
      (failureOrMessageCreated) {
        print("AAAA ${failureOrMessageCreated}");
        failureOrMessageCreated.fold(
          (failure) {},
          (messageCreated) {
            context.read<SenderBloc>().add(
                  SenderMessageSent(
                    emergencyMessage: messageCreated,
                    wait: const Duration(seconds: 5),
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
