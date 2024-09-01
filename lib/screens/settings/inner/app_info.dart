import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> appInfo = {
      t.app_info: globalAppName,
      t.app_version: "v$globalAppVersion",
      t.event_id: "asdD23Dewr5"
    };
    return Scaffold(
      appBar: appAppBar(title: "App Info"),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    rowOfInfo(appInfo.entries.elementAt(index)),
                separatorBuilder: (context, index) => kheasydevDivider(
                    black: true, padding: EdgeInsets.symmetric(vertical: 16)),
                itemCount: appInfo.length)),
      ),
    );
  }

  Row rowOfInfo(MapEntry<String, String> rowInfo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(rowInfo.key),
        Text(rowInfo.value),
      ],
    );
  }
}
