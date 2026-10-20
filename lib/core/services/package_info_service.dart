import 'package:easy_birthday/core/services/session_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<void> getAppFutureInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  SessionService().appName = packageInfo.appName;
  SessionService().appVersion = packageInfo.version;
}
