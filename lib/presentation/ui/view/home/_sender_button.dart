import 'package:flutter/material.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/view/home/_sender_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SenderButton extends StatelessWidget {
  const SenderButton({
    required this.emergencyMessage, super.key,
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
          kIconSend,
          color: context.theme().colorScheme.onPrimary,
        ),
        onPressed: _onPressed,
      ),
    );
  }
}
