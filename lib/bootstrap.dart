import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
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
  final response = await getIt<GenerativeModel>()
      .generateContent([Content.text("traduci ciao in inglese")]);
  print("AAAA ${response.text}");
  runApp(then());
}