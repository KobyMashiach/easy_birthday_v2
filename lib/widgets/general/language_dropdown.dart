import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/models/language_model/language_model.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageDropdown extends StatefulWidget {
  final VoidCallback onLanguageChange;

  const LanguageDropdown({super.key, required this.onLanguageChange});
  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  late List<LanguageModel> languages;

  @override
  void initState() {
    languages = LanguageModel.getAllLanguages()
        .where((language) => language.enable)
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final textDirection = Directionality.of(context);
        final isRTL = textDirection == TextDirection.rtl;

        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            isRTL ? 0 : 100,
            100,
            isRTL ? 100 : 0,
            0,
          ),
          items: languages.map((LanguageModel language) {
            return PopupMenuItem<LanguageModel>(
              value: language,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(language.name),
                  SvgPicture.asset(
                    getFlag(language.flag),
                    width: 20,
                  ),
                ],
              ),
            );
          }).toList(),
        ).then((selectedValue) {
          if (selectedValue != null) {
            setState(() {
              changeLanguage(
                LanguageModel.getAppLocale(selectedValue.languageCode),
              );
            });
            widget.onLanguageChange.call();
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          getFlag(getLanguageCode()),
          width: 50,
        ),
      ),
    );
  }
}
