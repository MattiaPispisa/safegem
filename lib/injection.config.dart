// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:en_logger/en_logger.dart' as _i10;
import 'package:flutter/material.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_generative_ai/google_generative_ai.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:speech_to_text/speech_to_text.dart' as _i4;

import 'application/emergency_composer/emergency_composer_bloc.dart' as _i13;
import 'application/emergency_contact/emergency_contact_bloc.dart' as _i9;
import 'application/sender/sender_bloc.dart' as _i3;
import 'application/speech_recognizer/speech_recognizer_bloc.dart' as _i16;
import 'application/user_settings/user_settings_cubit.dart' as _i15;
import 'data/ai.dart' as _i7;
import 'data/google_ai_module.dart' as _i8;
import 'data/impl_emergency_message.dart' as _i12;
import 'data/impl_speech_recognizer.dart' as _i14;
import 'domain/domain.dart' as _i11;
import 'logger.dart' as _i18;
import 'presentation/routing.dart' as _i17;

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
    final loggerModule = _$LoggerModule();
    gh.factory<_i3.SenderBloc>(() => _i3.SenderBloc());
    gh.factory<_i4.SpeechToText>(() => speechToTextModule.getRecognizer());
    gh.singleton<_i5.GenerativeModel>(() => googleGenerativeModule.model);
    gh.lazySingleton<_i6.RouterConfig<Object>>(() => routerConfigModule.router);
    gh.singleton<_i7.AI>(
      () => _i8.GoogleAI(model: gh<_i5.GenerativeModel>()),
      registerFor: {_production},
    );
    gh.factoryParam<_i9.EmergencyContactBloc, _i9.EmergencyContactBlocParams,
        dynamic>((
      params,
      _,
    ) =>
        _i9.EmergencyContactBloc(params));
    gh.lazySingleton<_i10.EnLogger>(
      () => loggerModule.loggerDev(),
      registerFor: {_develop},
    );
    gh.lazySingleton<_i10.EnLogger>(
      () => loggerModule.loggerProd(),
      registerFor: {_production},
    );
    gh.lazySingleton<_i11.EmergencyService>(() => _i12.ImplEmergencyService(
          gh<_i7.AI>(),
          gh<_i10.EnLogger>(),
        ));
    gh.singleton<_i7.AI>(
      () => const _i7.MockAI(),
      registerFor: {_develop},
    );
    gh.factory<_i13.EmergencyComposerBloc>(
        () => _i13.EmergencyComposerBloc(gh<_i11.EmergencyService>()));
    await gh.lazySingletonAsync<_i11.SpeechRecognizerService>(
      () => _i14.ImplSpeechRecognizerService.create(
        gh<_i4.SpeechToText>(),
        gh<_i10.EnLogger>(),
      ),
      preResolve: true,
    );
    gh.factory<_i15.UserSettingsCubit>(
        () => _i15.UserSettingsCubit(gh<_i10.EnLogger>()));
    gh.factory<_i16.SpeechRecognizerBloc>(() => _i16.SpeechRecognizerBloc(
          gh<_i11.SpeechRecognizerService>(),
          gh<_i10.EnLogger>(),
        ));
    return this;
  }
}

class _$SpeechToTextModule extends _i14.SpeechToTextModule {}

class _$GoogleGenerativeModule extends _i8.GoogleGenerativeModule {}

class _$RouterConfigModule extends _i17.RouterConfigModule {}

class _$LoggerModule extends _i18.LoggerModule {}
