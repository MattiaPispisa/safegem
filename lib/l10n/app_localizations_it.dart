import 'app_localizations.dart';

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get to => 'a';

  @override
  String get settings => 'Impostazioni';

  @override
  String get theme => 'Tema';

  @override
  String get dark => 'Scuro';

  @override
  String get light => 'Chiaro';

  @override
  String get brightness => 'Luminosità';

  @override
  String get emergencyContacts => 'Contatti di Emergenza';

  @override
  String get noConnectivity => 'Spiacente, sei offline. Controlla la tua connessione.';

  @override
  String get authorityNumberNotFound => 'Spiacente, non sono riuscito a trovare il numero di contatto delle autorità locali.';

  @override
  String get messageNotRecognized => 'Spiacente, non ho capito il messaggio';

  @override
  String get locationNotFound => 'Spiacente, non riesco a determinare la tua posizione.';

  @override
  String get unsupportedLocation => 'Spiacente, ma questo servizio non è attualmente disponibile nella tua regione.';

  @override
  String get unsupportedSpeechRecognizer => 'Spiacente, ma il servizio per il riconoscimento del testo dalla voce non è supportato.';

  @override
  String get speechRecognizerNotAvailable => 'Spiacente, ma questo dispositivo non supporta il riconoscimento vocale.';

  @override
  String get name => 'Nome';

  @override
  String get insertName => 'Inserisci un nome';

  @override
  String get phone => 'Telefono';

  @override
  String get insertValidPhone => 'Inserisci un numero di telefono valido';

  @override
  String get add => 'Aggiungi';

  @override
  String get edit => 'Modifica';

  @override
  String get delete => 'Elimina';

  @override
  String get emergencyContact => 'Contatto di Emergenza';

  @override
  String sureRemoveContact(Object name) {
    return 'Sei sicuro di voler eliminare il contatto di emergenza di $name?';
  }
}
