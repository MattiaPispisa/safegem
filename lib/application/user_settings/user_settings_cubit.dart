import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'user_settings_state.dart';

@injectable
class UserSettingsCubit extends HydratedCubit<UserSettingsState> {
  UserSettingsCubit() : super(UserSettingsState.initial());

  void toggleDarkMode() {
    emit(state.copyWith(darkMode: !state.darkMode));
  }

  void setColor(AppColor color) {
    emit(state.copyWith(selectedColor: color));
  }

  @override
  UserSettingsState? fromJson(Map<String, dynamic> json) {
    return UserSettingsState(
      availableColors: AppColor.values,
      darkMode: json['darkMode'] as bool? ?? false,
      selectedColor: AppColor._fromString(
        json['primaryColor'] as String?,
        () => AppColor.blue,
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(UserSettingsState state) {
    return {
      'darkMode': state.darkMode,
      'primaryColor': state.selectedColor.name,
    };
  }
}
