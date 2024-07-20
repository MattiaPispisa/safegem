import 'package:flutter_test/flutter_test.dart';
import 'package:safegem/application/application.dart';

import '../bloc_robot.dart';
import '_emergency_composer_robot.dart';

void main() {
  group(
    'emergency_composer_bloc',
    () {
      setUpAll(EmergencyComposerRobot.setUpAll);

      robotBlocTest<EmergencyComposerRobot, EmergencyComposerState>(
        'should create correctly',
        setUp: EmergencyComposerRobot.init,
      );

      robotBlocTest(
        'should sent message',
        setUp: EmergencyComposerRobot.init,
        act: (robot) => robot..addSentMessage(),
        expect: (robot) => [
          robot.state
            ..havingComposing(true)
            ..notHavingMessage(),
          robot.state
            ..havingComposing(false)
            ..havingMessage(),
        ],
      );
    },
  );
}
