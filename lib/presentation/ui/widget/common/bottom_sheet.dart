import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as m;
import 'package:safegem/presentation/ui/extension/extension.dart';

/// class that contains methods to handle bottom sheet.
/// See [AppBottomSheet.show]
abstract class AppBottomSheet {
  /// show a customized [showModalBottomSheet]
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required Widget Function(BuildContext context) builder,
    bool isDismissible = false,
    bool enableDrag = true,
  }) {
    final theme = context.appTheme();

    final barrierColor = Colors.black.withOpacity(0.6);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(theme.spacing.m),
        topRight: Radius.circular(theme.spacing.m),
      ),
    );
    Widget modalBuilder(BuildContext context) {
      return _BottomSheetContainer(
        key: const ValueKey('bottom_sheet_container'),
        builder: builder,
        title: title,
      );
    }

    if (Platform.isIOS) {
      return m.showCupertinoModalBottomSheet(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        barrierColor: barrierColor,
        shape: shape,
        builder: modalBuilder,
      );
    }
    return m.showMaterialModalBottomSheet(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      barrierColor: barrierColor,
      shape: shape,
      builder: modalBuilder,
    );
  }
}

class _BottomSheetContainer extends StatelessWidget {
  const _BottomSheetContainer({
    required this.builder,
    required this.title,
    super.key,
  });

  final Widget Function(BuildContext context) builder;
  final String title;

  double get _platformSpecificPadding {
    if (Platform.isIOS) {
      return 16;
    }
    return 4;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme();
    final viewInsets = MediaQuery.of(context).viewInsets;

    return SingleChildScrollView(
      controller: m.ModalScrollController.of(context),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: SafeArea(
        child: Padding(
          padding: viewInsets.copyWith(
            top: viewInsets.top + _platformSpecificPadding,
            bottom: theme.spacing.m + viewInsets.bottom,
            left: theme.spacing.horizontal,
            right: theme.spacing.horizontal,
          ),
          child: Column(
            children: [
              _appBar(context),
              builder(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    final theme = context.theme();

    return Row(
      children: [
        Expanded(child: Text(title)),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            color: theme.appBarTheme.iconTheme?.color,
          ),
        ),
      ],
    );
  }
}
