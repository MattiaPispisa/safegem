import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart' as t;

class TelephonyPermissionHandler extends StatefulWidget {
  const TelephonyPermissionHandler({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<TelephonyPermissionHandler> createState() =>
      _TelephonyPermissionHandlerState();
}

class _TelephonyPermissionHandlerState
    extends State<TelephonyPermissionHandler> {
  late final t.Telephony _telephony;
  bool _permissionGranted = false;
  bool get permissionGranted => _permissionGranted;

  @override
  void initState() {
    _telephony = t.Telephony.instance;
    _checkPermission();
    super.initState();
  }

  Future<bool> _checkPermission() async {
    _permissionGranted =
        (await _telephony.requestPhoneAndSmsPermissions) ?? false;
    return _permissionGranted;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
