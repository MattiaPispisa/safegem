import 'package:flutter_test/flutter_test.dart';

import '../bloc_robot.dart';
import '_user_settings_robot.dart';

void main() {
  group(
    'user_settings_bloc',
    () {
      setUpAll(UserSettingsRobot.setUpAll);

      robotBlocTest(
        'should init correctly',
        setUp: UserSettingsRobot.init,
        expect: (robot) => [],
      );

      robotBlocTest(
        'should toggle dark mode',
        setUp: UserSettingsRobot.init,
        act: (robot) => robot.bloc.toggleDarkMode(),
        expect: (robot) => [robot.state.havingDark(true)],
      );
    },
  );
}
