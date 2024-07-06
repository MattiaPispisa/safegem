import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/view/home/_emergency_listener.dart';
import 'package:safegem/presentation/ui/view/home/_provider.dart';
import 'package:safegem/presentation/ui/view/home/_sender.dart';

import '_app_bar.dart';
import '_gem_glow.dart';
import '_recognized_text.dart';
import '_speech_to_emergnecy.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme();

    return HomeProviders(
      child: SpeechToRecognizer(
        child: EmergencyListener(
          child: Scaffold(
            appBar: const HomeAppBar(),
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocGemGlow(),
                          SizedBox(height: theme.spacing.between),
                          BlocRecognizedText(),
                        ],
                      ),
                    ),
                  ),
                ),
                BlocSender()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
