import 'dart:io';

import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/app_network_image.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_editor/presentation/bloc/add_quiz_game_bloc.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/button_container.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/edit_title_dialog.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class AddQuizGameScreen extends StatelessWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;

  final void Function(List<QuestionModel> questions, bool lock) onDone;

  /// Lets the partner play again (clears their answers).
  final VoidCallback openQuizAgain;
  const AddQuizGameScreen({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
    required this.openQuizAgain,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddQuizGameBloc.fromContext(context, category: category),
      child: _AddQuizGameView(
        category: category,
        onChangeTitle: onChangeTitle,
        onDone: onDone,
        openQuizAgain: openQuizAgain,
      ),
    );
  }
}

class _AddQuizGameView extends StatefulWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;
  final void Function(List<QuestionModel> questions, bool lock) onDone;
  final VoidCallback openQuizAgain;

  const _AddQuizGameView({
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
    required this.openQuizAgain,
  });

  @override
  State<_AddQuizGameView> createState() => _AddQuizGameViewState();
}

class _AddQuizGameViewState extends State<_AddQuizGameView> {
  bool lock = false;

  @override
  void initState() {
    super.initState();
    lock = widget.category.lock;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddQuizGameBloc, AddQuizGameState>(
      listenWhen: (_, current) => current.isOneShot,
      buildWhen: (_, current) => !current.isOneShot,
      listener: (context, state) => kheasydevAppToast(t.something_went_wrong),
      builder: (context, state) => _buildScaffold(
        context,
        loading: state is Loading,
        questionsList: state.questions,
      ),
    );
  }

  Widget _buildScaffold(
    BuildContext context, {
    required bool loading,
    required List<QuestionModel> questionsList,
  }) {
    return Scaffold(
      appBar: appAppBar(title: t.quiz_game),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...topWidgets,
                    ..._playedSection(),
                    const SizedBox(height: 24),
                    Text(t.num_of_questions(number: questionsList.length)),
                    buttons(questionsList),
                    const SizedBox(height: 24),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: questionsList.length,
                      separatorBuilder: (context, index) => kheasydevDivider(
                        black: true,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                      ),
                      itemBuilder: (context, index) => ListTile(
                        title: Text(questionsList[index].text),
                        trailing: switch (questionsList[index].imageUrl) {
                          final String url => imageContainer(url),
                          null => null,
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonOnTap: () {
          // Ignored while a question image uploads, so the question being
          // added isn't dropped from the save.
          if (loading) return;
          widget.onDone.call(questionsList, lock);
          context.popIfPossible();
        },
      ),
    );
  }

  /// Once the partner has answered: how they did, and a way to let them
  /// play again (like the memory game).
  List<Widget> _playedSection() {
    final List<QuestionModel> saved = widget.category.quizGame ?? const [];
    final int answered = saved.where((q) => q.isLocked).length;
    if (answered == 0) return const [];
    return [
      const SizedBox(height: 16),
      Text(
        t.quiz_game_played(
          context: SessionService().gender,
          name: SessionService().partner?.name ?? '',
          answered: answered,
          total: saved.length,
          score: widget.category.quizGameScore,
        ),
        textAlign: TextAlign.center,
      ),
      appButton(
        text: t.open_new_quiz_game,
        unfillColors: true,
        margin: const EdgeInsets.only(top: 8),
        onTap: () {
          widget.openQuizAgain();
          context.popIfPossible();
        },
      ),
    ];
  }

  ConstrainedBox imageContainer(String imageUrl) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 20,
        minHeight: 20,
        maxWidth: 50,
      ),
      child: AppNetworkImage(url: imageUrl, memCacheWidth: 150),
    );
  }

  Row buttons(List<QuestionModel> questionsList) {
    final AddQuizGameBloc bloc = context.read<AddQuizGameBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttonContainer(
          title: t.add_question(context: SessionService().gender),
          icon: Icons.add,
          onTap: () => context.pushNamed(
            Routing.addQuestion,
            extra: (
              category: widget.category,
              onDone: (QuestionModel question, File? image) =>
                  bloc.add(.addQuestion(question, image)),
            ),
          ),
        ),
        buttonContainer(
          title: t.remove_question(context: SessionService().gender),
          icon: Icons.remove,
          onTap: () => questionsList.isNotEmpty
              ? context.pushNamed(
                  Routing.removeQuestions,
                  extra: (
                    questionsList: questionsList,
                    onDone: (List<int> indexes) =>
                        bloc.add(.removeQuestions(indexes)),
                  ),
                )
              : kheasydevAppToast(t.no_questions_add),
        ),
        buttonContainer(
          icon: lock ? Icons.lock_outline : Icons.lock_open,
          title: lock ? t.lock : t.unlock,
          onTap: () => setState(() => lock = !lock),
        ),
      ],
    );
  }

  List<Widget> get topWidgets {
    return [
      Text(t.quiz_game, style: AppTextStyle().bigTitle),
      SvgPicture.asset(widget.category.categoryType.getImage(), height: 200),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              t.add_quiz_to(
                title: widget.category.displayTitle,
              ),
              style: AppTextStyle().title,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => AddTitleDialog(
                  title: widget.category.displayTitle,
                  onInputText: (text) {
                    widget.onChangeTitle.call(
                      widget.category.copyWith(titleAppear: text),
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    ];
  }
}
