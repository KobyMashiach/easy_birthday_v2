import 'package:device_info_plus/device_info_plus.dart';

Future<bool> checkIfWearOS() async {
  final deviceInfo = DeviceInfoPlugin();
  final androidInfo = await deviceInfo.androidInfo;
  return androidInfo.systemFeatures.contains('android.hardware.type.watch');
}
