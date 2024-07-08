import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:safegem/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies(String? environment) =>
    getIt.init(environment: environment);
