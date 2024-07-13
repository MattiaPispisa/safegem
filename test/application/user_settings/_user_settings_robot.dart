import 'package:safegem/application/application.dart';

import '../bloc_robot.dart';

class UserSettingsRobot extends BlocRobot<UserSettingsState> {
  UserSettingsRobot._(this.bloc);

  factory UserSettingsRobot.init() {
    return UserSettingsRobot._(UserSettingsCubit());
  }

  /// setUpAll
  static void setUpAll() {
    initHydratedStorage();
  }

  @override
  UserSettingsCubit bloc;

  @override
  void dispose() {
    bloc.close();
  }

  @override
  UserSettingsMatcher get state => UserSettingsMatcher();
}

class UserSettingsMatcher extends BlocStateRobotMatcher<UserSettingsState> {
  UserSettingsMatcher havingDark(bool dark) {
    add(
      (state) => state.having((state) => state.darkMode, 'darkMode', dark),
    );
    return this;
  }
}
