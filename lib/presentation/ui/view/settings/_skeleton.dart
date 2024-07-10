import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import '_section_header.dart';

class SettingsSection {
  const SettingsSection({
    required this.title,
     this.headerTrailing,
    required this.content,
  });

  final String title;
  final Widget? headerTrailing;
  final Widget content;
}

class SettingsSkeleton extends StatelessWidget {
  const SettingsSkeleton({
    super.key,
    required this.sections,
  });

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
