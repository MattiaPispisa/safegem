import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/injection.dart';

/// [BlocProvider] with [UserSettingsCubit]
class UserSettingsProvider extends StatelessWidget {
  const UserSettingsProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserSettingsCubit>(),
      child: child,
    );
  }
}
