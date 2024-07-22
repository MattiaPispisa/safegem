import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get to => 'à';

  @override
  String get settings => 'Paramètres';

  @override
  String get theme => 'Thème';

  @override
  String get dark => 'Sombre';

  @override
  String get light => 'Clair';

  @override
  String get brightness => 'Luminosité';

  @override
  String get emergencyContacts => 'Contacts d\'urgence';

  @override
  String get noConnectivity => 'Désolé, vous êtes hors ligne. Veuillez vérifier votre connexion.';

  @override
  String get authorityNumberNotFound => 'Désolé, je n\'ai pas pu trouver le numéro de contact des autorités locales.';

  @override
  String get messageNotRecognized => 'Désolé, je n\'ai pas compris le message';

  @override
  String get locationNotFound => 'Désolé, je ne parviens pas à déterminer votre position.';

  @override
  String get unsupportedLocation => 'Désolé, mais ce service n\'est actuellement pas disponible dans votre région.';

  @override
  String get unsupportedSpeechRecognizer => 'Désolé, mais le service de reconnaissance vocale n\'est pas pris en charge.';

  @override
  String get speechRecognizerNotAvailable => 'Désolé, mais cet appareil ne supporte pas la reconnaissance vocale.';

  @override
  String get name => 'Nom';

  @override
  String get insertName => 'Insérez le nom';

  @override
  String get phone => 'Téléphone';

  @override
  String get insertValidPhone => 'Insérez un numéro de téléphone valide';

  @override
  String get add => 'Ajouter';

  @override
  String get edit => 'Modifier';

  @override
  String get delete => 'Supprimer';

  @override
  String get emergencyContact => 'Contact d\'urgence';

  @override
  String sureRemoveContact(Object name) {
    return 'Êtes-vous sûr de vouloir supprimer le contact d\'urgence de $name?';
  }
}
