import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/injection.dart';

/// [BlocProvider] with [UserSettingsCubit]
class UserSettingsProvider extends StatelessWidget {
  /// constructor
  const UserSettingsProvider({
    required this.child,
    super.key,
  });

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserSettingsCubit>(),
      child: child,
    );
  }
}

/// [UserSettingsCubit] helper
extension UserSettingsHelper on BuildContext {
  /// select [EmergencyContact] from [UserSettingsCubit]
  List<EmergencyContact> emergencyContacts() {
    return select<UserSettingsCubit, List<EmergencyContact>>(
      (bloc) => bloc.state.emergencyContacts,
    );
  }
}
