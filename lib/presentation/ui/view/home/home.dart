import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/view/home/_app_bar.dart';
import 'package:safegem/presentation/ui/view/home/_emergency_listener.dart';
import 'package:safegem/presentation/ui/view/home/_error.dart';
import 'package:safegem/presentation/ui/view/home/_gem_glow.dart';
import 'package:safegem/presentation/ui/view/home/_provider.dart';
import 'package:safegem/presentation/ui/view/home/_recognized_text.dart';
import 'package:safegem/presentation/ui/view/home/_sender.dart';
import 'package:safegem/presentation/ui/view/home/_speech_to_emergency.dart';

/// Home view
class HomeView extends StatelessWidget {
  /// constructor
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
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const BlocGemGlow(),
                          SizedBox(height: theme.spacing.between),
                          const BlocRecognizedText(),
                        ],
                      ),
                    ),
                  ),
                ),
                const BlocSender(),
                const BlocError(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
