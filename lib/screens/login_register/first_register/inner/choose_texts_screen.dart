import 'package:easy_birthday/core/persona_functions.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/text_items_model/text_item_model.dart';
import 'package:easy_birthday/widgets/cards/capsule_expanded_text_card.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

class ChooseTextsScreen extends StatefulWidget {
  const ChooseTextsScreen(
      {super.key, required this.onContinue, required this.onPrevious});

  final Function(Map<String, String> choosenTexts) onContinue;
  final VoidCallback onPrevious;

  @override
  State<ChooseTextsScreen> createState() => _ChooseTextsScreenState();
}

class _ChooseTextsScreenState extends State<ChooseTextsScreen> {
  Map<String, String> choosenItems = {};
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
      onPopInvokedWithResult: (didPop, result) => widget.onPrevious(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.58,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: items.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
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
                      onTextChoosen: (value) =>
                          choosenItems[textItems.title] = value,
                      textChoose: choosenItems.keys
                          .any((key) => textItems.title == key),
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),
              appButton(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                text: t.display_result,
                onTap: choosenItems.length != items.length
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
                                      Text(buildReadyTexts(
                                          choosenItems: choosenItems,
                                          textEnum: ReadyTextEnum.title)),
                                    ],
                                  ),
                                  kheasydevDivider(black: true),
                                  Row(
                                    children: [
                                      Text("${t.description}:  "),
                                      Text(buildReadyTexts(
                                          choosenItems: choosenItems,
                                          textEnum: ReadyTextEnum.description)),
                                    ],
                                  ),
                                  Text(t.got_full_app),
                                  kheasydevDivider(black: true),
                                ],
                              )),
                        );
                      },
                disableColors: choosenItems.length != items.length,
              ),
            ],
          ),
        ),
        bottomNavigationBar: AppButtonsBottomNavigationBar(
          activeButtonText: t.continue_,
          activeButtonOnTap: () {
            if (choosenItems.length == items.length) {
              widget.onContinue.call(choosenItems);
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
