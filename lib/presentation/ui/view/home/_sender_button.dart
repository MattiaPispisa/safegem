import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../domain/domain.dart';
import '_sender_constants.dart';

class SenderButton extends StatelessWidget {
  const SenderButton({
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
          kIconSend,
          color: context.theme().colorScheme.onPrimary,
        ),
        onPressed: _onPressed,
      ),
    );
  }
}
