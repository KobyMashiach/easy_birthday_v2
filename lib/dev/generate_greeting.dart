import 'dart:developer';

import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/persona_functions.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/text_items_model/text_item_model.dart';
import 'package:easy_birthday/widgets/cards/capsule_expanded_text_card.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenerateGreeting extends StatefulWidget {
  const GenerateGreeting({super.key});

  @override
  State<GenerateGreeting> createState() => _GenerateGreetingState();
}

class _GenerateGreetingState extends State<GenerateGreeting> {
  String generateText = "";
  final GenderContext gender = getPartnerGender();
  int? expandedIndex;
  Map<String, String> choosenItems = {};

  late TextEditingController freeTextController;

  @override
  void initState() {
    freeTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    freeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, TextItemModel> items = {
      "lines_number": TextItemModel(
        title: "lines_number",
        text: t.lines_number,
        items: List.generate(45, (num) => (num + 6).toString()),
      ),
      "max_words_in_line": TextItemModel(
        title: "max_words_in_line",
        text: t.max_words_in_line,
        items: List.generate(10, (num) => (num + 3).toString()),
      ),
      "use_emojis": TextItemModel(
        title: "use_emojis",
        text: t.use_emojis,
        items: [t.yes, t.no],
      ),
    };
    return Scaffold(
      appBar: appAppBar(title: "Generate Text"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Easy Birthday", style: AppTextStyle().bigTitle),
            const SizedBox(height: 24),
            SvgPicture.asset(
              textWriteIllustration,
              height: 200,
            ),
            const SizedBox(height: 24),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final TextItemModel textItems =
                    items.entries.elementAt(index).value;
                return CapsuleExpandedTextCard(
                  textItems: textItems,
                  isExpanded: expandedIndex == index,
                  onTap: () {
                    setState(() {
                      if (expandedIndex == index) {
                        expandedIndex = null;
                      } else {
                        expandedIndex = index;
                      }
                    });
                  },
                  titleSize: 200,
                  isNumbers: index <= 1,
                  onTextChoosen: (value) =>
                      choosenItems[textItems.title] = value,
                  textChoose:
                      choosenItems.keys.any((key) => textItems.title == key),
                );
              },
            ),
            AppTextField(
              hintText: "${t.add_free_text} (${t.no_required})",
              controller: freeTextController,
              maxLines: 5,
              textInputAction: TextInputAction.newline,
              keyboard: TextInputType.multiline,
            )
          ],
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonText: t.continue_,
        activeButtonOnTap: () {
          String message = "";
          message += t.generate_text_description(
            relationship: globalEvent!.choosenTexts!.entries
                .firstWhere((e) => e.key == "relationship")
                .value,
            name: globalPartnerUser!.name,
            myName: globalUser.name,
            lineNumber: choosenItems.entries
                .firstWhere((e) => e.key == "lines_number")
                .value,
            wordsInLineNumebr: choosenItems.entries
                .firstWhere((e) => e.key == "max_words_in_line")
                .value,
          );
          if (choosenItems.entries
                  .firstWhere((e) => e.key == "use_emojis")
                  .value ==
              t.yes) {
            message += "\n" + t.use_emojis;
          }
          message += "\n" + freeTextController.text;
          log(message);
        },
      ),
    );
  }
}
