// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_generative_ai/google_generative_ai.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:speech_to_text/speech_to_text.dart' as _i3;

import 'application/emergency_composer/emergency_composer_bloc.dart' as _i10;
import 'application/speech_recognizer/speech_recognizer_bloc.dart' as _i9;
import 'data/ai_module.dart' as _i12;
import 'data/impl_emergency_message.dart' as _i8;
import 'data/impl_speech_recognizer.dart' as _i7;
import 'domain/domain.dart' as _i6;
import 'presentation/routing.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final speechToTextModule = _$SpeechToTextModule();
    final routerConfigModule = _$RouterConfigModule();
    final googleGenerativeModule = _$GoogleGenerativeModule();
    gh.factory<_i3.SpeechToText>(() => speechToTextModule.getRecognizer());
    gh.factory<_i4.RouterConfig<Object>>(() => routerConfigModule.router);
    gh.singleton<_i5.GenerativeModel>(() => googleGenerativeModule.model);
    await gh.lazySingletonAsync<_i6.SpeechRecognizerService>(
      () => _i7.ImplSpeechRecognizerService.create(gh<_i3.SpeechToText>()),
      preResolve: true,
    );
    gh.lazySingleton<_i6.EmergencyService>(
        () => _i8.ImplEmergencyService(gh<_i5.GenerativeModel>()));
    gh.factory<_i9.SpeechRecognizerBloc>(
        () => _i9.SpeechRecognizerBloc(gh<_i6.SpeechRecognizerService>()));
    gh.factory<_i10.EmergencyComposerBloc>(
        () => _i10.EmergencyComposerBloc(gh<_i6.EmergencyService>()));
    return this;
  }
}

class _$SpeechToTextModule extends _i7.SpeechToTextModule {}

class _$RouterConfigModule extends _i11.RouterConfigModule {}

class _$GoogleGenerativeModule extends _i12.GoogleGenerativeModule {}
