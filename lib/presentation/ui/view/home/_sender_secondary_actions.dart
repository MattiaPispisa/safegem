import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/view/home/_sender_constants.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';

const _kSecondaryActionHeight = 28.0;

/// Contains all possible secondary actions for the emergency message,
/// such as the option to call the emergency number.
class SenderSecondaryActions extends StatelessWidget {
  /// constructor
  const SenderSecondaryActions({
    required this.emergencyMessage,
    super.key,
  });

  /// emergency message
  final EmergencyMessage emergencyMessage;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();

    final buttons = [
      ChipButton(
        iconData: FontAwesomeIcons.phone,
        text: emergencyMessage.authorityNumber,
        iconColor: Colors.green,
        onPressed: () {
          launchUrl(emergencyMessage.phone);
        },
      ),
      ChipButton(
        iconData: kIconSend,
        text: emergencyMessage.authorityNumber,
        iconColor: theme.primaryColor,
        onPressed: () {
          launchUrl(emergencyMessage.phone);
        },
      ),
    ];

    final space = SizedBox(
      width: theme.app.spacing.m,
    );

    return SizedBox(
      height: _kSecondaryActionHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: buttons.length,
        separatorBuilder: (context, index) {
          return space;
        },
        itemBuilder: (context, index) {
          return buttons[index];
        },
      ),
    );
  }
}
