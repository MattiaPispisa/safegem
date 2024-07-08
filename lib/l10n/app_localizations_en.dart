import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get to => 'to';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get brightness => 'Brightness';

  @override
  String get emergencyContacts => 'Emergency Contacts';

  @override
  String get noConnectivity => 'Sorry, you are offline. Please check your connection.';

  @override
  String get authorityNumberNotFound => 'Sorry, I couldn\'t find the contact number for the local authorities.';

  @override
  String get messageNotRecognized => 'Sorry, I couldn\'t understand the message';

  @override
  String get locationNotFound => 'Sorry, I can\'t seem to determine your location.';

  @override
  String get unsupportedLocation => 'Sorry, but this service is currently not available in your region.';
}
