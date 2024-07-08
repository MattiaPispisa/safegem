// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_generative_ai/google_generative_ai.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:speech_to_text/speech_to_text.dart' as _i5;

import 'application/emergency_composer/emergency_composer_bloc.dart' as _i14;
import 'application/emergency_contact/emergency_contact_bloc.dart' as _i9;
import 'application/sender/sender_bloc.dart' as _i3;
import 'application/speech_recognizer/speech_recognizer_bloc.dart' as _i13;
import 'application/user_settings/user_settings_cubit.dart' as _i4;
import 'data/ai_module.dart' as _i8;
import 'data/impl_emergency_message.dart' as _i11;
import 'data/impl_speech_recognizer.dart' as _i12;
import 'domain/domain.dart' as _i10;
import 'presentation/routing.dart' as _i15;

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
    final googleGenerativeModule = _$GoogleGenerativeModule();
    final routerConfigModule = _$RouterConfigModule();
    gh.factory<_i3.SenderBloc>(() => _i3.SenderBloc());
    gh.factory<_i4.UserSettingsCubit>(() => _i4.UserSettingsCubit());
    gh.factory<_i5.SpeechToText>(() => speechToTextModule.getRecognizer());
    gh.singleton<_i6.GenerativeModel>(() => googleGenerativeModule.model);
    gh.lazySingleton<_i7.RouterConfig<Object>>(() => routerConfigModule.router);
    gh.singleton<_i8.AI>(
      () => _i8.GoogleAI(model: gh<_i6.GenerativeModel>()),
      registerFor: {_production},
    );
    gh.factoryParam<_i9.EmergencyContactBloc, _i9.EmergencyContactBlocParams,
        dynamic>((
      params,
      _,
    ) =>
        _i9.EmergencyContactBloc(params));
    gh.lazySingleton<_i10.EmergencyService>(
        () => _i11.ImplEmergencyService(gh<_i8.AI>()));
    await gh.lazySingletonAsync<_i10.SpeechRecognizerService>(
      () => _i12.ImplSpeechRecognizerService.create(gh<_i5.SpeechToText>()),
      preResolve: true,
    );
    gh.factory<_i13.SpeechRecognizerBloc>(
        () => _i13.SpeechRecognizerBloc(gh<_i10.SpeechRecognizerService>()));
    gh.factory<_i14.EmergencyComposerBloc>(
        () => _i14.EmergencyComposerBloc(gh<_i10.EmergencyService>()));
    gh.singleton<_i8.AI>(
      () => const _i8.MockAI(),
      registerFor: {_develop},
    );
    return this;
  }
}

class _$SpeechToTextModule extends _i12.SpeechToTextModule {}

class _$GoogleGenerativeModule extends _i8.GoogleGenerativeModule {}

class _$RouterConfigModule extends _i15.RouterConfigModule {}
