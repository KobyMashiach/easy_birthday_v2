import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/app_settings_model/app_settings_model.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  List<Map<String, dynamic>> settingsOptions(BuildContext context) {
    final List<Map<String, dynamic>> settingOptions = [
      {
        'title': "Clear all hive boxes",
        'icon': Icons.storage_rounded,
        'function': () {
          Hive.box<AppSettingsModel>(AppSettingsModel.hiveKey).clear();
          Hive.box<PersonaModel>(PersonaModel.hiveKey).clear();
        }
      },
    ];
    return settingOptions;
  }

  @override
  Widget build(BuildContext context) {
    final settingOptions = settingsOptions(context);
    return Scaffold(
      appBar: appAppBar(title: t.settings),
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
                  title: Text(settingOptions[index]['title'].toString()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
