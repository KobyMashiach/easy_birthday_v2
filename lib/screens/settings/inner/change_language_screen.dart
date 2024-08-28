import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.change_language),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final language = getAllLanguages().entries.elementAt(index);
              final languageData = language.value.entries.first;
              return ListTile(
                leading: Text(languageData.value),
                trailing: SvgPicture.asset("${languageData.value}.svg"),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemCount: getAllLanguages().length,
          ),
        ),
      ),
    );
  }
}
