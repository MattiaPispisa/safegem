part of 'user_settings_cubit.dart';

final class UserSettingsState extends Equatable {
  const UserSettingsState({
    required this.selectedColor,
    required this.darkMode,
    required this.availableColors,
  });

  factory UserSettingsState.initial() {
    return UserSettingsState(
      darkMode: false,
      selectedColor: AppColor.blue,
      availableColors: AppColor.values,
    );
  }

  final List<AppColor> availableColors;
  final AppColor selectedColor;
  final bool darkMode;

  MaterialColor get materialColor {
    return selectedColor._color(darkMode);
  }

  MaterialColor colorOf(AppColor color) {
    return color._color(darkMode);
  }

  UserSettingsState copyWith({
    bool? darkMode,
    AppColor? selectedColor,
  }) {
    return UserSettingsState(
      availableColors: availableColors,
      darkMode: darkMode ?? this.darkMode,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  @override
  List<Object> get props => [
        selectedColor,
        darkMode,
        availableColors,
      ];
}

enum AppColor {
  blue('blue'),
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
