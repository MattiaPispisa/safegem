part of 'user_settings_cubit.dart';

/// [UserSettingsCubit] state
@JsonSerializable()
final class UserSettingsState extends Equatable {
  /// constructor
  const UserSettingsState({
    required this.selectedColor,
    required this.darkMode,
    required this.availableColors,
    required this.emergencyContacts,
  });

  /// [UserSettingsState] from json
  factory UserSettingsState.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsStateFromJson(json);

  /// [UserSettingsCubit] initial state
  factory UserSettingsState.initial() {
    return const UserSettingsState(
      darkMode: false,
      selectedColor: AppColor.blue,
      availableColors: AppColor.values,
      emergencyContacts: [],
    );
  }

  /// preset of colors
  @JsonKey(
    fromJson: _colorsFromJson,
    toJson: _colorsToJson,
  )
  final List<AppColor> availableColors;

  /// current app color
  final AppColor selectedColor;

  /// current app brightness
  final bool darkMode;

  /// list of user emergency contacts
  final List<EmergencyContact> emergencyContacts;

  /// material color based on [selectedColor] and [darkMode]
  MaterialColor get materialColor {
    return selectedColor._color(darkMode);
  }

  /// material color based on [color] and [darkMode]
  MaterialColor colorOf(AppColor color) {
    return color._color(darkMode);
  }

  /// default copyWith
  UserSettingsState copyWith({
    bool? darkMode,
    AppColor? selectedColor,
    List<EmergencyContact>? emergencyContacts,
  }) {
    return UserSettingsState(
      availableColors: availableColors,
      darkMode: darkMode ?? this.darkMode,
      selectedColor: selectedColor ?? this.selectedColor,
      emergencyContacts: emergencyContacts ?? this.emergencyContacts,
    );
  }

  /// [UserSettingsState] to json
  Map<String, dynamic> toJson() => _$UserSettingsStateToJson(this);

  @override
  List<Object> get props => [
        selectedColor,
        darkMode,
        availableColors,
        emergencyContacts,
      ];
}

List<AppColor> _colorsFromJson(json) => AppColor.values;
Object? _colorsToJson(state) => null;

/// enum of possible colors
enum AppColor {
  /// blue
  @JsonValue('blue')
  blue('blue'),

  /// violet
  @JsonValue('violet')
  violet('violet'),

  /// green
  @JsonValue('green')
  green('green');

  const AppColor(this.name);

  /// name
  final String name;

  /// apply [dark] to create the material color
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
      case (AppColor.green, false):
        return _green;
      case (AppColor.green, true):
        return _darkGreen;
    }
  }
}

const _green = MaterialColor(
  0xFF4CAF50,
  <int, Color>{
    50: Color(0xFFE8F5E9),
    100: Color(0xFFC8E6C9),
    200: Color(0xFFA5D6A7),
    300: Color(0xFF81C784),
    400: Color(0xFF66BB6A),
    500: Color(0xFF4CAF50),
    600: Color(0xFF43A047),
    700: Color(0xFF388E3C),
    800: Color(0xFF2E7D32),
    900: Color(0xFF1B5E20),
  },
);

const _darkGreen = MaterialColor(
  0xFF388E3C,
  <int, Color>{
    50: Color(0xFF6D9B86),
    100: Color(0xFF5F957C),
    200: Color(0xFF508E71),
    300: Color(0xFF428765),
    400: Color(0xFF3B7E5D),
    500: Color(0xFF388E3C),
    600: Color(0xFF337E36),
    700: Color(0xFF2D6F30),
    800: Color(0xFF276125),
    900: Color(0xFF1B4A1D),
  },
);
