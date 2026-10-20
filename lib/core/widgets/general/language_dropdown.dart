import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/i18n/language_model.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageDropdown extends StatefulWidget {
  final VoidCallback onLanguageChange;
  final double? size;
  final EdgeInsets? padding;

  const LanguageDropdown({
    super.key,
    required this.onLanguageChange,
    this.size,
    this.padding,
  });

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  final List<LanguageModel> _languages = LanguageModel.getAllLanguages()
      .where((language) => language.enable)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: t.choose_language,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          final bool isRTL = Directionality.of(context) == TextDirection.rtl;
          final double position = widget.padding != null ? 20 : 100;
          final LanguageModel? selectedValue = await showMenu<LanguageModel>(
            context: context,
            position: RelativeRect.fromLTRB(
              isRTL ? 0 : position,
              position,
              isRTL ? position : 0,
              0,
            ),
            items: _languages.map((LanguageModel language) {
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
          );
          if (selectedValue == null) return;
          await changeLanguage(
            LanguageModel.getAppLocale(selectedValue.languageCode),
          );
          if (!mounted) return;
          setState(() {});
          widget.onLanguageChange();
        },
        // Keep at least a 44pt hit target even for small flags.
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.all(8.0),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: SvgPicture.asset(
                getFlag(getLanguageCode()),
                width: widget.size ?? 50,
                excludeFromSemantics: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
