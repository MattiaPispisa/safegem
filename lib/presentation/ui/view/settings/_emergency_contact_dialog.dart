import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/emergency_contact/emergency_contact_bloc.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/injection.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/widget/common/common.dart';

void showEmergencyContactDialog(
  BuildContext context, {
  required EmergencyContact? emergencyContact,
}) {
  AppBottomSheet.show(
    context,
    title: "test",
    builder: (context) {
      return _EmergencyContactForm();
    },
  );
}

class _EmergencyContactForm extends StatelessWidget {
  const _EmergencyContactForm({
    super.key,
    this.emergencyContact,
  });

  final EmergencyContact? emergencyContact;
  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme();

    return BlocProvider(
      create: (context) => getIt<EmergencyContactBloc>(
        param1: EmergencyContactBlocParams(
          emergencyContact: emergencyContact,
        ),
      ),
      child: BlocConsumer<EmergencyContactBloc, EmergencyContactState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextFormField(
                hintText: "name",
                initialValue: state.name,
                validator: (_) {
                  if (!state.showError) {
                    return null;
                  }
                  if (state.emptyName) {
                    return "insert name";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: theme.spacing.l,
              ),
              AppTextFormField(
                hintText: "number",
                keyboardType: TextInputType.phone,
                validator: (_) {
                  if (!state.showError) {
                    return null;
                  }
                  if (state.invalidNumber) {
                    return "invalid number";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: theme.spacing.l * 3,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("ciao"),
              ),
            ],
          );
        },
      ),
    );
  }
}
