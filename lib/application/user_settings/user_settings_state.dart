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

  /// green
  @JsonValue('green')
  green('green'),

  /// gold
  @JsonValue('gold')
  gold('gold'),

  /// pink
  @JsonValue('pink')
  pink('pink'),

  /// orange
  @JsonValue('orange')
  orange('orange'),

  /// violet
  @JsonValue('violet')
  violet('violet');

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
      case (AppColor.pink, false):
        return _pink;
      case (AppColor.pink, true):
        return _pinkDark;
      case (AppColor.gold, false):
        return _gold;
      case (AppColor.gold, true):
        return _goldDark;
      case (AppColor.orange, false):
        return _orange;
      case (AppColor.orange, true):
        return _orangeDark;
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

const _pink = MaterialColor(
  0xFFFFB6C1,
  <int, Color>{
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEEAABB),
    300: Color(0xFFEEAABB),
    400: Color(0xFFEEAABB),
    500: Color(0xFFFFB6C1),
    600: Color(0xFFFFAAB5),
    700: Color(0xFFFF9DA8),
    800: Color(0xFFFF91A2),
    900: Color(0xFFFF8295),
  },
);

const _pinkDark = MaterialColor(
  0xFFDB7093,
  <int, Color>{
    50: Color(0xFF3B0A31),
    100: Color(0xFF6A0D5A),
    200: Color(0xFF970F82),
    300: Color(0xFFC311AA),
    400: Color(0xFFE114D2),
    500: Color(0xFFDB7093),
    600: Color(0xFFE33CBA),
    700: Color(0xFFEA6DE2),
    800: Color(0xFFF39FF7),
    900: Color(0xFFFFC4FB),
  },
);

const _gold = MaterialColor(
  0xFFFFD700,
  <int, Color>{
    50: Color(0xFFFFF8DC),
    100: Color(0xFFFFF1C6),
    200: Color(0xFFFFE39C),
    300: Color(0xFFFFD571),
    400: Color(0xFFFFCA4D),
    500: Color(0xFFFFD700),
    600: Color(0xFFFFD200),
    700: Color(0xFFFFCD00),
    800: Color(0xFFFFC800),
    900: Color(0xFFFFC100),
  },
);

const _goldDark = MaterialColor(
  0xFFB8860B,
  <int, Color>{
    50: Color(0xFF5A461B),
    100: Color(0xFF826D2C),
    200: Color(0xFFA88F3C),
    300: Color(0xFFC7AE4C),
    400: Color(0xFFD9C261),
    500: Color(0xFFB8860B),
    600: Color(0xFFD3A400),
    700: Color(0xFFE5B700),
    800: Color(0xFFF0C700),
    900: Color(0xFFF6D200),
  },
);

const _orange = MaterialColor(
  0xFFFFA500,
  <int, Color>{
    50: Color(0xFFFFF7E6),
    100: Color(0xFFFFE4BF),
    200: Color(0xFFFFD399),
    300: Color(0xFFFFC173),
    400: Color(0xFFFFB358),
    500: Color(0xFFFFA500),
    600: Color(0xFFFF9D00),
    700: Color(0xFFFF9500),
    800: Color(0xFFFF8C00),
    900: Color(0xFFFF8200),
  },
);

const _orangeDark = MaterialColor(
  0xFFFF8C00,
  <int, Color>{
    50: Color(0xFF5A3F09),
    100: Color(0xFF825B12),
    200: Color(0xFFA87F1B),
    300: Color(0xFFC19F25),
    400: Color(0xFFD3B43A),
    500: Color(0xFFFF8C00),
    600: Color(0xFFEA7F00),
    700: Color(0xFFE56F00),
    800: Color(0xFFE05F00),
    900: Color(0xFFDC4C00),
  },
);
