import 'package:easy_birthday/screens/settings/inner/choose_app_color.dart';
import 'package:easy_birthday/screens/settings/inner/sex_change.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/onwillpop.dart';
import 'package:easy_birthday/widgets/general/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/widgets/navigate_page.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settingOptions = [
      {
        'title': 'שינוי צבע',
        'icon': Icons.color_lens_outlined,
        'function': () async {
          KheasydevNavigatePage()
              .push(context, ChooseAppColors(settings: true));
        }
      },
      {
        'title': 'שינוי מין',
        'icon': Icons.man_2_outlined,
        'function': () async {
          KheasydevNavigatePage().push(context, SexChange(settings: true));
        }
      },
    ];

    return PopScope(
      onPopInvoked: (value) => appOnwillpop(context),
      child: Scaffold(
        appBar: appAppBar(title: "הגדרות"),
        drawer: appSideMenu(context, index: 1),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: settingOptions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemBuilder: (context, index) {
              return Card(
                child: GestureDetector(
                  onTap: () => settingOptions[index]['function'](),
                  child: ListTile(
                      leading: Icon(settingOptions[index]['icon']),
                      title: Text(settingOptions[index]['title'].toString())),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
