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

import 'application/emergency_composer/emergency_composer_bloc.dart' as _i11;
import 'application/sender/sender_bloc.dart' as _i12;
import 'application/speech_recognizer/speech_recognizer_bloc.dart' as _i10;
import 'data/ai_module.dart' as _i6;
import 'data/impl_emergency_message.dart' as _i8;
import 'data/impl_speech_recognizer.dart' as _i9;
import 'domain/domain.dart' as _i7;
import 'presentation/routing.dart' as _i13;

const String _production = 'production';
const String _develop = 'develop';

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
    gh.singleton<_i6.AI>(
      () => _i6.GoogleAI(model: gh<_i5.GenerativeModel>()),
      registerFor: {_production},
    );
    gh.lazySingleton<_i7.EmergencyService>(
        () => _i8.ImplEmergencyService(gh<_i6.AI>()));
    await gh.lazySingletonAsync<_i7.SpeechRecognizerService>(
      () => _i9.ImplSpeechRecognizerService.create(gh<_i3.SpeechToText>()),
      preResolve: true,
    );
    gh.factory<_i10.SpeechRecognizerBloc>(
        () => _i10.SpeechRecognizerBloc(gh<_i7.SpeechRecognizerService>()));
    gh.factory<_i11.EmergencyComposerBloc>(
        () => _i11.EmergencyComposerBloc(gh<_i7.EmergencyService>()));
    gh.factory<_i12.SenderBloc>(
        () => _i12.SenderBloc(gh<_i7.EmergencyService>()));
    gh.singleton<_i6.AI>(
      () => const _i6.MockAI(),
      registerFor: {_develop},
    );
    return this;
  }
}

class _$SpeechToTextModule extends _i9.SpeechToTextModule {}

class _$RouterConfigModule extends _i13.RouterConfigModule {}

class _$GoogleGenerativeModule extends _i6.GoogleGenerativeModule {}
