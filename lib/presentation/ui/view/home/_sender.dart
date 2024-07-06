import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/widget.dart';

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: theme.spacing.m),
          Expanded(
            child: _SenderMessage(emergencyMessage: emergencyMessage),
          ),
          SizedBox(width: theme.spacing.m),
          _SenderButton(emergencyMessage: emergencyMessage)
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
        padding: EdgeInsets.all(theme.spacing.m),
        child: child,
      ),
    );
  }
}

class _SenderMessage extends StatelessWidget {
  const _SenderMessage({
    super.key,
    required this.emergencyMessage,
  });

  final EmergencyMessage emergencyMessage;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme();
    final size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _number(context),
        SizedBox(height: theme.spacing.m),
        Container(
          decoration: BoxDecoration(
            color: theme.colors.neutral.shade50,
            borderRadius: BorderRadius.circular(theme.spacing.m),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.spacing.m),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: size.height / 3),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: theme.spacing.m),
                    Text(
                      emergencyMessage.message,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: theme.spacing.m),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _number(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: "${context.t().to}: ",
          style: context
              .theme()
              .textTheme
              .bodyMedium
              ?.copyWith(color: context.theme().app.colors.neutral.shade500),
        ),
        TextSpan(
          text: emergencyMessage.authorityNumber,
          style: context
              .theme()
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}

class _SenderButton extends StatelessWidget {
  const _SenderButton({
    super.key,
    required this.emergencyMessage,
  });

  final EmergencyMessage emergencyMessage;

  void _onPressed() {
    launchUrl(
      emergencyMessage.sms,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        icon: Icon(
          Icons.send,
          color: context.theme().colorScheme.onPrimary,
        ),
        onPressed: _onPressed,
      ),
    );
  }
}
