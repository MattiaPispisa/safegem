import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:safegem/injection.dart';

void bootstrap({
  required Widget Function() then,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  final storageDirectory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: storageDirectory);

  configureDependencies();
  runApp(then());
}
