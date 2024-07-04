import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/widget.dart';

class BlocSender extends StatelessWidget {
  const BlocSender({super.key});

  @override
  Widget build(BuildContext context) {
    return SenderBuilder(
      builder: (context, state) {
        return state.emergencyMessage.fold(
          () {
            return SizedBox();
          },
          (emergencyMessage) {
            return Sender(
              emergencyMessage: emergencyMessage,
            ).animate().slideY(begin: 1, end: 0);
          },
        );
      },
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
    final iconSize = context.theme().iconTheme.size;
    final theme = context.appTheme();

    return _SenderContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width: iconSize),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _number(context),
        SizedBox(height: theme.spacing.m),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: theme.colors.neutral.shade50,
              borderRadius: BorderRadius.circular(theme.spacing.m),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacing.m),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: theme.spacing.m),
                    Text(emergencyMessage.message),
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
          color: theme.app.colors.neutral.shade50,
        ),
        onPressed: _onPressed,
      ),
    );
  }
}
