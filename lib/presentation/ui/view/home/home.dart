import 'package:flutter/material.dart';

import '_gem_glow.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GemGlow(),
      ),
    );
  }
}
