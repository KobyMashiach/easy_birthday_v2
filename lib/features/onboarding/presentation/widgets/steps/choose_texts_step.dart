import 'package:easy_birthday/core/utils/gender_utils.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/ready_texts.dart';
import 'package:easy_birthday/features/event/data/models/text_item_model.dart';
import 'package:easy_birthday/core/widgets/cards/capsule_expanded_text_card.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

class ChooseTextsScreen extends StatefulWidget {
  const ChooseTextsScreen({
    super.key,
    required this.onContinue,
    required this.onPrevious,
  });

  final void Function(Map<String, String> chosenTexts) onContinue;
  final VoidCallback onPrevious;

  @override
  State<ChooseTextsScreen> createState() => _ChooseTextsScreenState();
}

class _ChooseTextsScreenState extends State<ChooseTextsScreen> {
  Map<String, String> chosenItems = {};
  int? expandedIndex;
  final gender = getPartnerGender();

  @override
  Widget build(BuildContext context) {
    Map<String, TextItemModel> items = {
      "title_text": TextItemModel(
        title: "title_text",
        text: t.title,
        items: [
          t.celebrant(context: gender),
          t.indicating(context: gender),
        ],
      ),
      "relationship": TextItemModel(
        title: "relationship",
        text: t.relationship,
        items: [
          t.married(context: gender),
          t.spouse(context: gender),
          t.soul_mate,
        ],
      ),
    };

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) widget.onPrevious();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Shrinks (the list scrolls) when the screen is too short.
              Flexible(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.58,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: items.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final textItems = items.values.elementAt(index);
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
                        onTextChosen: (value) =>
                            chosenItems[textItems.title] = value,
                        textChoose: chosenItems.containsKey(textItems.title),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 28),
              appButton(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                text: t.display_result,
                onTap: chosenItems.length != items.length
                    ? null
                    : () async {
                        await showDialog(
                          context: context,
                          builder: (context) => generalDialog(
                            title: t.display_result,
                            oneButton: true,
                            description: t.we_use,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("${t.title}:  "),
                                    Text(
                                      buildReadyTexts(
                                        chosenItems: chosenItems,
                                        textEnum: ReadyTextEnum.title,
                                      ),
                                    ),
                                  ],
                                ),
                                kheasydevDivider(black: true),
                                Row(
                                  children: [
                                    Text("${t.description}:  "),
                                    Text(
                                      buildReadyTexts(
                                        chosenItems: chosenItems,
                                        textEnum: ReadyTextEnum.description,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(t.got_full_app),
                                kheasydevDivider(black: true),
                              ],
                            ),
                          ),
                        );
                      },
                disableColors: chosenItems.length != items.length,
              ),
            ],
          ),
        ),
        bottomNavigationBar: AppButtonsBottomNavigationBar(
          activeButtonText: t.continue_,
          activeButtonOnTap: () {
            if (chosenItems.length == items.length) {
              widget.onContinue.call(chosenItems);
            } else {
              kheasydevAppToast(t.fill_all_fields);
            }
          },
          inactiveButtonText: t.back,
          inactiveButtonOnTap: widget.onPrevious,
        ),
      ),
    );
  }
}
