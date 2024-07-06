import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:safegem/domain/domain.dart';

part 'user_settings_state.dart';
part 'user_settings_cubit.g.dart';

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
    return UserSettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UserSettingsState state) {
    return state.toJson();
  }
}
