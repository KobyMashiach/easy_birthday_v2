import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/text_item_model.dart';
import 'package:easy_birthday/core/widgets/cards/capsule_expanded_text_card.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/features/category_editor/presentation/bloc/generate_greeting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

class GenerateGreeting extends StatelessWidget {
  final void Function(String? generateText) generateGreeting;
  const GenerateGreeting({super.key, required this.generateGreeting});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerateGreetingBloc.fromContext(context),
      child: _GenerateGreetingView(generateGreeting: generateGreeting),
    );
  }
}

class _GenerateGreetingView extends StatefulWidget {
  final void Function(String? generateText) generateGreeting;
  const _GenerateGreetingView({required this.generateGreeting});

  @override
  State<_GenerateGreetingView> createState() => _GenerateGreetingViewState();
}

class _GenerateGreetingViewState extends State<_GenerateGreetingView> {
  int? expandedIndex;
  final Map<String, String> chosenItems = {};

  final TextEditingController freeTextController = TextEditingController();
  final Map<String, TextItemModel> items = {
    "lines_number": TextItemModel(
      title: "lines_number",
      text: t.lines_number,
      items: List.generate(45, (number) => (number + 6).toString()),
    ),
    "max_words_in_line": TextItemModel(
      title: "max_words_in_line",
      text: t.max_words_in_line,
      items: List.generate(10, (number) => (number + 3).toString()),
    ),
    "use_emojis": TextItemModel(
      title: "use_emojis",
      text: t.use_emojis,
      items: [t.yes, t.no],
    ),
  };

  @override
  void dispose() {
    freeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenerateGreetingBloc, GenerateGreetingState>(
      listenWhen: (_, current) => current.isOneShot,
      buildWhen: (_, current) => !current.isOneShot,
      listener: (context, state) => kheasydevAppToast(t.something_went_wrong),
      builder: (context, state) => _buildScaffold(
        context,
        loading: state is Loading,
        generateText: state.generatedText,
      ),
    );
  }

  Widget _buildScaffold(
    BuildContext context, {
    required bool loading,
    required String generateText,
  }) {
    return Scaffold(
      appBar: appAppBar(title: t.create_greeting_using_ai),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Text("Easy Birthday", style: AppTextStyle().bigTitle),
                  const SizedBox(height: 24),
                  SvgPicture.asset(textWriteIllustration, height: 200),
                  const SizedBox(height: 24),
                  if (generateText.isNotEmpty)
                    appButton(
                      margin: const EdgeInsets.all(24.0),
                      text: t.display_result,
                      unfillColors: true,
                      onTap: () async => await showDialog(
                        context: context,
                        builder: (context) => generalDialog(
                          title: t.greeting_before_edit,
                          description: generateText,
                          oneButton: true,
                          okButtonText: t.exit,
                          noButtons: true,
                        ),
                      ),
                    ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final TextItemModel textItems = items.entries
                          .elementAt(index)
                          .value;
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
                        onTextChosen: (value) =>
                            chosenItems[textItems.title] = value,
                        textChoose: chosenItems.containsKey(textItems.title),
                        displayResult: true,
                        currentValue: chosenItems[textItems.title],
                      );
                    },
                  ),
                  AppTextField(
                    hintText: "${t.add_free_text} (${t.no_required})",
                    controller: freeTextController,
                    maxLines: 5,
                    textInputAction: TextInputAction.newline,
                    keyboard: TextInputType.multiline,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          t.greeting_notes,
                          style: AppTextStyle().smallDescription,
                        ),
                      ],
                    ),
                  ),
                  appButton(
                    text: generateText.isEmpty
                        ? t.generate_greeting
                        : t.generate_new_greeting,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    onTap: items.length == chosenItems.length
                        ? buildTheMessage
                        : null,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonText: t.edit_greeting,
        activeButtonDisable: generateText.isEmpty,
        activeButtonOnTap: generateText.isEmpty
            ? null
            : () => widget.generateGreeting.call(generateText),
      ),
    );
  }

  void buildTheMessage() {
    String message = "";
    message += t.generate_text_description(
      relationship: SessionService().event?.chosenTexts?['relationship'] ?? '',
      name: SessionService().partner?.name ?? '',
      myName: SessionService().user.name,
      age: calculateNextAge(),
      lineNumber: chosenItems["lines_number"] ?? '',
      wordsInLineNumber: chosenItems["max_words_in_line"] ?? '',
    );

    if (chosenItems["use_emojis"] == t.yes) {
      message += "\n${t.use_emojis}";
    }
    message += "\n${freeTextController.text}";
    context.read<GenerateGreetingBloc>().add(.generate(message));
    debugPrint(message);
  }
}
