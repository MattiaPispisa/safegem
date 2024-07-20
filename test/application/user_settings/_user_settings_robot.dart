import 'package:en_logger/en_logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/domain/domain.dart';

import '../bloc_robot.dart';

class _MockLogger extends Mock implements EnLogger {}

class UserSettingsRobot extends BlocRobot<UserSettingsState> {
  UserSettingsRobot._(this.bloc);

  factory UserSettingsRobot.init() {
    return UserSettingsRobot._(UserSettingsCubit(_MockLogger()));
  }

  /// setUpAll
  static void setUpAll() {
    initHydratedStorage();
  }

  @override
  UserSettingsCubit bloc;

  @override
  UserSettingsMatcher get state => UserSettingsMatcher();
}

class UserSettingsMatcher extends BlocStateRobotMatcher<UserSettingsState> {
  void havingDark(bool dark) {
    add(
      (state) => state.having((state) => state.darkMode, 'darkMode', dark),
    );
  }

  void havingColor(AppColor selectedColor) {
    add(
      (state) => state.having(
        (state) => state.selectedColor,
        'selectedColor',
        selectedColor,
      ),
    );
  }

  void havingContacts(List<EmergencyContact> emergencyContacts) {
    add(
      (state) => state.having(
        (state) => state.emergencyContacts,
        'emergencyContacts',
        emergencyContacts,
      ),
    );
  }
}
