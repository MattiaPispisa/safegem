import 'package:flutter_test/flutter_test.dart';
import 'package:safegem/application/user_settings/user_settings_cubit.dart';
import 'package:safegem/domain/model/model.dart';

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
        act: (robot) => robot.bloc..toggleDarkMode(),
        expect: (robot) => [robot.state..havingDark(true)],
      );

      robotBlocTest(
        'should change selected color',
        setUp: UserSettingsRobot.init,
        act: (robot) => robot.bloc.setColor(AppColor.gold),
        expect: (robot) => [
          robot.state
            ..havingDark(false)
            ..havingColor(AppColor.gold),
        ],
      );

      robotBlocTest(
        'should add contact',
        setUp: UserSettingsRobot.init,
        act: (robot) => robot.bloc.addEmergencyContact(_mattiaContact),
        expect: (robot) => [
          robot.state..havingContacts([_mattiaContact]),
        ],
      );

      robotBlocTest(
        'should remove contact',
        setUp: UserSettingsRobot.init,
        act: (robot) => robot.bloc
          ..addEmergencyContact(_mattiaContact)
          ..removeEmergencyContact(_mattiaContact),
        expect: (robot) => [
          robot.state..havingContacts([_mattiaContact]),
          robot.state..havingContacts([]),
        ],
      );

      robotBlocTest(
        'should edit contact',
        setUp: UserSettingsRobot.init,
        act: (robot) => robot.bloc
          ..addEmergencyContact(_mattiaContact)
          ..editEmergencyContact(_mattiaContact, _mattiaContactFixed),
        expect: (robot) => [
          robot.state..havingContacts([_mattiaContact]),
          robot.state..havingContacts([_mattiaContactFixed]),
        ],
      );
    },
  );
}

const _mattiaContact = EmergencyContact(
  displayName: 'Mattia',
  number: '1234',
);

const _mattiaContactFixed = EmergencyContact(
  displayName: 'Mattia',
  number: '12345',
);
