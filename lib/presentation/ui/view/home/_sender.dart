import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:url_launcher/url_launcher.dart';

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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: iconSize ?? 24),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("to: ${emergencyMessage.authorityNumber}"),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Text(
                            emergencyMessage.message,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            IconButton.filled(
              enableFeedback: true,
              icon: Icon(
                Icons.send,
                size: 24,
              ),
              alignment: Alignment.center,
              onPressed: () {
                launchUrl(
                  emergencyMessage.sms,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
