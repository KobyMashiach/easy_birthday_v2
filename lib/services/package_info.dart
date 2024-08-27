import 'package:package_info_plus/package_info_plus.dart';

String globalAppName = "";
String globalAppVersion = "";

getAppFutureInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  globalAppName = packageInfo.appName;
  globalAppVersion = packageInfo.version;
}
