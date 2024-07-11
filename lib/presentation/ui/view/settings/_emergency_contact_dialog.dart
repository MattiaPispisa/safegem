import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:safegem/application/emergency_contact/emergency_contact_bloc.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/injection.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/widget/common/common.dart';

/// show a bottom sheet with a form to create and edit an [EmergencyContact]
///
/// provide the [emergencyContact] to edit it
///
/// on success [onDone] is called
Future<void> showEmergencyContactDialog(
  BuildContext context, {
  required EmergencyContact? emergencyContact,
  required void Function(EmergencyContact emergencyContact) onDone,
}) {
  return AppBottomSheet.show<EmergencyContact>(
    context,
    title: context.t().emergencyContact,
    builder: (context) {
      return _EmergencyContactForm(
        emergencyContact: emergencyContact,
        key: const ValueKey('emergency_contact'),
      );
    },
  ).then((contact) {
    if (contact == null) {
      return;
    }
    onDone(contact);
  });
}

class _EmergencyContactForm extends StatefulWidget {
  const _EmergencyContactForm({
    this.emergencyContact,
    super.key,
  });

  final EmergencyContact? emergencyContact;

  @override
  State<_EmergencyContactForm> createState() => _EmergencyContactFormState();
}

class _EmergencyContactFormState extends State<_EmergencyContactForm> {
  late FocusNode _nameFocusNode;
  late FocusNode _phoneFocusNode;

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _nameFocusNode.requestFocus();
    });
  }

  void _listener(BuildContext context, EmergencyContactState state) {
    state.optionOrEmergencyContactCreated.fold(() {}, (contact) {
      context.pop(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme();

    return BlocProvider(
      create: (context) => getIt<EmergencyContactBloc>(
        param1: EmergencyContactBlocParams(
          emergencyContact: widget.emergencyContact,
        ),
      ),
      child: BlocConsumer<EmergencyContactBloc, EmergencyContactState>(
        listener: _listener,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _name(context, state),
              SizedBox(height: theme.spacing.l),
              _phone(context, state),
              SizedBox(height: theme.spacing.beforeAction),
              _submit(context, state),
            ],
          );
        },
      ),
    );
  }

  Widget _name(BuildContext context, EmergencyContactState state) {
    return AppTextFormField(
      hintText: context.t().name,
      initialValue: state.name,
      prefixIconData: FontAwesomeIcons.user,
      focusNode: _nameFocusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => _phoneFocusNode.requestFocus(),
      onChanged: (text) => context
          .read<EmergencyContactBloc>()
          .add(EmergencyContactChangedName(name: text)),
      validator: (_) {
        if (!state.showError) {
          return null;
        }
        if (state.emptyName) {
          return context.t().insertName;
        }
        return null;
      },
    );
  }

  Widget _phone(BuildContext context, EmergencyContactState state) {
    return AppTextFormField(
      hintText: context.t().phone,
      initialValue: state.number,
      keyboardType: TextInputType.phone,
      prefixIconData: FontAwesomeIcons.phone,
      focusNode: _phoneFocusNode,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => _phoneFocusNode.unfocus(),
      onChanged: (text) => context
          .read<EmergencyContactBloc>()
          .add(EmergencyContactChangedNumber(number: text)),
      validator: (_) {
        if (!state.showError) {
          return null;
        }
        if (state.invalidNumber) {
          return context.t().insertValidPhone;
        }
        return null;
      },
    );
  }

  Widget _submit(BuildContext context, EmergencyContactState state) {
    return ElevatedButton(
      onPressed: () => context
          .read<EmergencyContactBloc>()
          .add(const EmergencyContactSubmitted()),
      child: Text(
        state.editing ? context.t().edit : context.t().add,
      ),
    );
  }
}
