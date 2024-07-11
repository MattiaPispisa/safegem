import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/view/settings/_section_header.dart';

/// define the structure of a settings section.
///
/// this is used to build the [SettingsSkeleton]
class SettingsSection {
  /// constructor
  const SettingsSection({
    required this.title,
    required this.content,
    this.headerTrailing,
  });

  /// section title
  final String title;

  /// optional widget on [title] end
  final Widget? headerTrailing;

  /// section content
  final Widget content;
}

/// iterator over [sections] to build settings
class SettingsSkeleton extends StatelessWidget {
  /// constructor
  const SettingsSkeleton({
    required this.sections,
    super.key,
  });

  /// settings sections
  final List<SettingsSection> sections;

  List<Widget> _sectionWidgets(
    SettingsSection section,
    Widget space,
  ) {
    return [
      SettingsSectionHeader(
        text: section.title,
        trailing: section.headerTrailing,
      ),
      space,
      section.content,
      space,
      space,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final space = SizedBox(
      height: context.appTheme().spacing.between,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections
          .map((section) => _sectionWidgets(section, space))
          .expand(id)
          .toList(),
    );
  }
}
