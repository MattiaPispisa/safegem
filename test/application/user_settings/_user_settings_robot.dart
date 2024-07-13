import 'package:safegem/application/application.dart';

import '../bloc_robot.dart';

class UserSettingsRobot extends BlocRobot<UserSettingsState> {
  UserSettingsRobot._(this.bloc);

  factory UserSettingsRobot.init() {
    return UserSettingsRobot._(UserSettingsCubit());
  }

  @override
  UserSettingsCubit bloc;

  @override
  void dispose() {
    bloc.close();
  }

  @override
  BlocStateRobotMatcher<UserSettingsState> get state => UserSettingsMatcher();
}

class UserSettingsMatcher extends BlocStateRobotMatcher<UserSettingsState> {}
