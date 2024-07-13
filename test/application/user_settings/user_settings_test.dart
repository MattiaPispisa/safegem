import 'package:flutter_test/flutter_test.dart';

import '../bloc_robot.dart';
import '_user_settings_robot.dart';

void main() {
  group('user_settings_bloc', () {
    robotBlocTest(
      'should init correctly',
      setUp: UserSettingsRobot.init,
      expect: (robot) => [],
    );
  });
}
