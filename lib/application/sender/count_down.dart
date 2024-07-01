import 'dart:async';

import 'package:flutter/foundation.dart';

class CountDown {
  CountDown({
    required this.duration,
    required this.onTick,
    required this.onEnd,
  });

  void start() {
    _cancel();

    _timerTick = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick >= duration.inSeconds) {
        _timerTick?.cancel();
      }
      onTick(timer.tick);
    });
    _timerOnEnd = Timer(duration, onEnd);
  }

  void cancel() {
    _cancel();
  }

  void _cancel() {
    _timerTick?.cancel();
    _timerOnEnd?.cancel();
  }

  final Duration duration;
  final void Function(int tick) onTick;
  final VoidCallback onEnd;

  Timer? _timerTick;
  Timer? _timerOnEnd;
}
