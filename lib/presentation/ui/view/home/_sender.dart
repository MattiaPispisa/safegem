import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

import '../../widget/widget.dart';
import '_sender_button.dart';
import '_sender_message.dart';
import '_sender_secondary_actions.dart';

class BlocSender extends StatefulWidget {
  const BlocSender({super.key});

  @override
  State<BlocSender> createState() => _BlocSenderState();
}

class _BlocSenderState extends State<BlocSender>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const nothing = SizedBox();
    return SpeechRecognizerOnStartListening(
      onListening: () => controller.reverse(),
      child: SenderOnNewMessage(
        onMessage: (_) => controller.forward(),
        child: SenderBuilder(
          builder: (context, state) {
            return state.emergencyMessage.fold(
              () {
                return nothing;
              },
              (emergencyMessage) {
                return Sender(
                  emergencyMessage: emergencyMessage,
                ).animate(controller: controller).slideY(begin: 1, end: 0);
              },
            );
          },
        ),
      ),
    );
  }
}

class Sender extends StatelessWidget {
  const Sender({
    super.key,
    required this.emergencyMessage,
  });
  final EmergencyMessage emergencyMessage;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme();

    return _SenderContainer(
      key: ValueKey('sender_container'),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SenderMessage(
                  key: ValueKey('sender_message'),
                  emergencyMessage: emergencyMessage,
                ),
              ),
              SizedBox(width: theme.spacing.m),
              SenderButton(
                key: ValueKey('sender_button'),
                emergencyMessage: emergencyMessage,
              )
            ],
          ),
          SizedBox(height: theme.spacing.m),
          SenderSecondaryActions(
            key: ValueKey('sender_secondary_actions'),
            emergencyMessage: emergencyMessage,
          ),
          SizedBox(height: theme.spacing.s),
        ],
      ),
    );
  }
}

class _SenderContainer extends StatelessWidget {
  const _SenderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(theme.spacing.m),
          topRight: Radius.circular(theme.spacing.m),
        ),
        color: theme.colors.neutral.shade100,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: theme.spacing.m,
          left: theme.spacing.l,
          top: theme.spacing.m,
        ),
        child: child,
      ),
    );
  }
}

