import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get to => 'zu';

  @override
  String get settings => 'Einstellungen';

  @override
  String get theme => 'Thema';

  @override
  String get dark => 'Dunkel';

  @override
  String get light => 'Hell';

  @override
  String get brightness => 'Helligkeit';

  @override
  String get emergencyContacts => 'Notfallkontakte';

  @override
  String get noConnectivity => 'Entschuldigung, Sie sind offline. Bitte überprüfen Sie Ihre Verbindung.';

  @override
  String get authorityNumberNotFound => 'Entschuldigung, ich konnte die Kontaktnummer der örtlichen Behörden nicht finden.';

  @override
  String get messageNotRecognized => 'Entschuldigung, ich konnte die Nachricht nicht verstehen';

  @override
  String get locationNotFound => 'Entschuldigung, ich kann Ihren Standort nicht bestimmen.';

  @override
  String get unsupportedLocation => 'Entschuldigung, aber dieser Dienst ist derzeit in Ihrer Region nicht verfügbar.';

  @override
  String get unsupportedSpeechRecognizer => 'Entschuldigung, aber der Dienst zur Erkennung von Text aus Sprache wird nicht unterstützt.';

  @override
  String get speechRecognizerNotAvailable => 'Entschuldigung, aber dieses Gerät unterstützt keine Spracherkennung.';

  @override
  String get name => 'Name';

  @override
  String get insertName => 'Name eingeben';

  @override
  String get phone => 'Telefon';

  @override
  String get insertValidPhone => 'Geben Sie eine gültige Telefonnummer ein';

  @override
  String get add => 'Hinzufügen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get delete => 'Löschen';

  @override
  String get emergencyContact => 'Notfallkontakt';

  @override
  String sureRemoveContact(Object name) {
    return 'Sind Sie sicher, dass Sie den Notfallkontakt von $name löschen möchten?';
  }
}
