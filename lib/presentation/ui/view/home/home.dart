import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/view/home/_provider.dart';

import '_gem_glow.dart';
import '_recognized_text.dart';
import '_speech_to_emergnecy.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeProviders(
      child: SpeechToRecognizer(
        child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocGemGlow(),
                RecognizedText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
