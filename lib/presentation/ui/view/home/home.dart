import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/view/home/_emergency_listener.dart';
import 'package:safegem/presentation/ui/view/home/_provider.dart';
import 'package:safegem/presentation/ui/view/home/_sender.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';

import '_gem_glow.dart';
import '_recognized_text.dart';
import '_speech_to_emergnecy.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return HomeProviders(
      child: SpeechToRecognizer(
        child: EmergencyListener(
          child: Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              actions: [],
            ),
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
                          RecognizedText(),
                        ],
                      ),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: size.height / 2),
                  child: SenderBuilder(
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
