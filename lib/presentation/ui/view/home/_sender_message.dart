import 'package:flutter/material.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

class SenderMessage extends StatelessWidget {
  const SenderMessage({
    required this.emergencyMessage, super.key,
  });

  final EmergencyMessage emergencyMessage;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme();
    final size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _number(context),
        SizedBox(height: theme.spacing.s),
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
                physics: const BouncingScrollPhysics(),
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
          text: '${context.t().to}: ',
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
      ],),
    );
  }
}
