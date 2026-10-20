import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

bool? _isWearOsCache;

/// True only on Android watches. Must never touch `androidInfo` on iOS/web,
/// where the plugin can't build an AndroidDeviceInfo and throws.
Future<bool> checkIfWearOS() async {
  if (kIsWeb || !Platform.isAndroid) return false;
  if (_isWearOsCache != null) return _isWearOsCache!;
  final androidInfo = await DeviceInfoPlugin().androidInfo;
  return _isWearOsCache = androidInfo.systemFeatures.contains(
    'android.hardware.type.watch',
  );
}
