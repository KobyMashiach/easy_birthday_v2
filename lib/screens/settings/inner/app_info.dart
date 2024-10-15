import 'package:easy_birthday/core/text_styles.dart';
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
      t.app_name: globalAppName,
      t.app_version: "v$globalAppVersion",
      t.event_id: globalEvent?.eventId ?? "Empty",
      t.current_plan: globalEvent?.planSubscribe.title ?? "Free"
    };
    return Scaffold(
      appBar: appAppBar(title: t.info),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(t.app_info, style: AppTextStyle().title),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        rowOfInfo(appInfo.entries.elementAt(index)),
                    separatorBuilder: (context, index) => kheasydevDivider(
                        black: true,
                        padding: const EdgeInsets.symmetric(vertical: 16)),
                    itemCount: appInfo.length,
                  ),
                  const SizedBox(height: 12),
                  Text(t.partner_info, style: AppTextStyle().title),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        rowOfInfo(appInfo.entries.elementAt(index)),
                    separatorBuilder: (context, index) => kheasydevDivider(
                        black: true,
                        padding: const EdgeInsets.symmetric(vertical: 16)),
                    itemCount: appInfo.length,
                  ),
                ],
              )),
        ),
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
