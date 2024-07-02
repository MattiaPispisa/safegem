import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GemGlow extends StatelessWidget {
  const GemGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      startDelay: const Duration(milliseconds: 1000),
      glowColor: Colors.blue,
      glowShape: BoxShape.circle,
      animate: true,
      curve: Curves.fastOutSlowIn,
      child: FaIcon(FontAwesomeIcons.gem),
    );
  }
}

