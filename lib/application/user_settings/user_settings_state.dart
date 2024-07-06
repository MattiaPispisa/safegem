part of 'user_settings_cubit.dart';

@JsonSerializable()
final class UserSettingsState extends Equatable {
  const UserSettingsState({
    required this.selectedColor,
    required this.darkMode,
    required this.availableColors,
    required this.emergencyContacts,
  });

  factory UserSettingsState.initial() {
    return UserSettingsState(
      darkMode: false,
      selectedColor: AppColor.blue,
      availableColors: AppColor.values,
      emergencyContacts: [],
    );
  }

  final List<AppColor> availableColors;
  final AppColor selectedColor;
  final bool darkMode;
  final List<EmergencyContact> emergencyContacts;

  MaterialColor get materialColor {
    return selectedColor._color(darkMode);
  }

  MaterialColor colorOf(AppColor color) {
    return color._color(darkMode);
  }

  UserSettingsState copyWith(
      {bool? darkMode,
      AppColor? selectedColor,
      List<EmergencyContact>? emergencyContacts}) {
    return UserSettingsState(
      availableColors: availableColors,
      darkMode: darkMode ?? this.darkMode,
      selectedColor: selectedColor ?? this.selectedColor,
      emergencyContacts: emergencyContacts ?? this.emergencyContacts,
    );
  }

  factory UserSettingsState.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsStateFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingsStateToJson(this);

  @override
  List<Object> get props => [
        selectedColor,
        darkMode,
        availableColors,
        emergencyContacts,
      ];
}

enum AppColor {
  @JsonValue('blue')
  blue('blue'),
  @JsonValue('violet')
  violet('violet');

  const AppColor(this.name);

  static AppColor _fromString(
    String? name,
    AppColor Function() orElse,
  ) {
    return AppColor.values.firstWhere(
      (v) => v.name == name,
      orElse: orElse,
    );
  }

  final String name;

  MaterialColor _color(bool dark) {
    switch ((this, dark)) {
      case (AppColor.blue, false):
        return Colors.blue;
      case (AppColor.blue, true):
        return Colors.lightBlue;
      case (AppColor.violet, false):
        return Colors.purple;
      case (AppColor.violet, true):
        return Colors.deepPurple;
    }
  }
}
