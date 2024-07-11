import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:safegem/domain/domain.dart';

part 'user_settings_state.dart';
part 'user_settings_cubit.g.dart';

/// Business logic to handle and persist user settings
@injectable
class UserSettingsCubit extends HydratedCubit<UserSettingsState> {
  /// constructor
  UserSettingsCubit() : super(UserSettingsState.initial());

  /// switch brightness
  void toggleDarkMode() {
    emit(state.copyWith(darkMode: !state.darkMode));
  }

  /// change app color
  void setColor(AppColor color) {
    emit(state.copyWith(selectedColor: color));
  }

  /// add [contact] in [UserSettingsState.emergencyContacts]
  void addEmergencyContact(EmergencyContact contact) {
    final emergencyContacts = List.of(state.emergencyContacts)..add(contact);

    emit(state.copyWith(emergencyContacts: emergencyContacts));
  }

  ///  update [contact] in [UserSettingsState.emergencyContacts]
  void editEmergencyContact(
    EmergencyContact previous,
    EmergencyContact contact,
  ) {
    final emergencyContacts = List.of(state.emergencyContacts);
    final index = state.emergencyContacts.indexOf(previous);

    if (index < 0) {
      return;
    }
    emergencyContacts[index] = contact;

    emit(state.copyWith(emergencyContacts: emergencyContacts));
  }

  /// remove [contact] in [UserSettingsState.emergencyContacts]
  void removeEmergencyContact(EmergencyContact contact) {
    final emergencyContacts = List.of(state.emergencyContacts)..remove(contact);
    emit(state.copyWith(emergencyContacts: emergencyContacts));
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
