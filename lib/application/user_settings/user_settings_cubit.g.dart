// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettingsState _$UserSettingsStateFromJson(Map<String, dynamic> json) =>
    UserSettingsState(
      selectedColor: $enumDecode(_$AppColorEnumMap, json['selectedColor']),
      darkMode: json['darkMode'] as bool,
      availableColors: (json['availableColors'] as List<dynamic>)
          .map((e) => $enumDecode(_$AppColorEnumMap, e))
          .toList(),
      emergencyContacts: (json['emergencyContacts'] as List<dynamic>)
          .map((e) => EmergencyContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserSettingsStateToJson(UserSettingsState instance) =>
    <String, dynamic>{
      'availableColors':
          instance.availableColors.map((e) => _$AppColorEnumMap[e]!).toList(),
      'selectedColor': _$AppColorEnumMap[instance.selectedColor]!,
      'darkMode': instance.darkMode,
      'emergencyContacts':
          instance.emergencyContacts.map((e) => e.toJson()).toList(),
    };

const _$AppColorEnumMap = {
  AppColor.blue: 'blue',
  AppColor.violet: 'violet',
};
