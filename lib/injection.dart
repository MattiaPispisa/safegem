import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:safegem/injection.config.dart';

/// get it instance
final getIt = GetIt.instance;

/// pre resolved dependency injection
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies(String? environment) =>
    getIt.init(environment: environment);
