// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_generative_ai/google_generative_ai.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import 'data/ai_module.dart' as _i6;
import 'presentation/routing.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final routerConfigModule = _$RouterConfigModule();
    final googleGenerativeModule = _$GoogleGenerativeModule();
    gh.factory<_i3.RouterConfig<Object>>(() => routerConfigModule.router);
    gh.singleton<_i4.GenerativeModel>(() => googleGenerativeModule.model);
    return this;
  }
}

class _$RouterConfigModule extends _i5.RouterConfigModule {}

class _$GoogleGenerativeModule extends _i6.GoogleGenerativeModule {}
