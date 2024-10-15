import 'dart:developer';

import 'package:flutter/services.dart';

const platform = MethodChannel('com.example/ringtone');

Future<void> setRingtoneForPhone(String filePath) async {
  try {
    await platform.invokeMethod('setRingtone', {'filePath': filePath});
  } on PlatformException catch (e) {
    log("Failed to set ringtone: '${e.message}'.");
  }
}

Future<void> selectContactAndSetRingtone(String filePath) async {
  try {
    await platform
        .invokeMethod('selectContactAndSetRingtone', {'filePath': filePath});
  } on PlatformException catch (e) {
    log("Failed to select contact and set ringtone: '${e.message}'.");
  }
}
