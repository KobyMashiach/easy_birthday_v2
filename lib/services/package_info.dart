import 'package:easy_birthday/services/global_vars.dart';
import 'package:package_info_plus/package_info_plus.dart';

getAppFutureInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  globalAppName = packageInfo.appName;
  globalAppVersion = packageInfo.version;
}
