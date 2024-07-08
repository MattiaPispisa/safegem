import 'dart:async';

import 'package:flutter/foundation.dart';

/// count down class
///
/// - Every second call [onTick].
/// - After [duration], [onEnd] is called.
class CountDown {
  /// constructor
  CountDown({
    required this.duration,
    required this.onTick,
    required this.onEnd,
  });

  /// start the countdown
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

  /// cancel the countdown
  void cancel() {
    _cancel();
  }

  void _cancel() {
    _timerTick?.cancel();
    _timerOnEnd?.cancel();
  }

  /// countdown duration
  final Duration duration;

  /// callback fired every second.
  /// `tick` is the elapsed time.
  final void Function(int tick) onTick;

  /// callback fired after [duration]
  final VoidCallback onEnd;

  Timer? _timerTick;
  Timer? _timerOnEnd;
}
