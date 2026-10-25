import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/enums.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/date_event_model.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/home/presentation/bloc/home_bloc.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/video_thumbnail_widget.dart';

class OwnerHomeScreen extends StatelessWidget {
  final List<CategoryModel> categories;
  const OwnerHomeScreen({super.key, required this.categories});

  Widget getCategoryWidget(
    BuildContext context,
    CategoryModel category,
    double screenWidth,
  ) {
    return switch (category.categoryType) {
      CategoryEnum.text => textWidget(category),
      CategoryEnum.pictures => picturesVideosWidget(
        category,
        screenWidth,
        pictures: true,
      ),
      CategoryEnum.videos => picturesVideosWidget(
        category,
        screenWidth,
        pictures: false,
      ),
      CategoryEnum.quizGame =>
        category.quizGame != null && category.quizGame!.isNotEmpty
            ? SingleChildScrollView(child: quizWidget(category))
            : Text(t.no_questions_add),
      // Full width (not a Row) so long descriptions wrap.
      CategoryEnum.birthdayCalendar => SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: category.calendarEvents != null
                ? category.calendarEvents!.dateEventMap.entries.map((entry) {
                    DateTime dateTime = entry.key;
                    List<DateEventModel> eventList = entry.value;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('dd/MM/yyyy').format(dateTime),
                            style: AppTextStyle().description.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          ...eventList.map((event) {
                            return Text(
                              '${event.time.format(context)} - ${event.description}',
                              style: AppTextStyle().smallDescription,
                            );
                          }),
                        ],
                      ),
                    );
                  }).toList()
                : [],
          ),
        ),
      ),
      CategoryEnum.birthdaySuprise => SingleChildScrollView(
        child: Column(children: surpriseMapToWidgets(category.surpriseMap)),
      ),
      CategoryEnum.wishesList =>
        category.wishesList?.lock ?? false
            ? Align(
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1. ${category.wishesList?.first ?? ""}"),
                    Text("2. ${category.wishesList?.second ?? ""}"),
                    Text("3. ${category.wishesList?.third ?? ""}"),
                  ],
                ),
              )
            : Text(t.no_wish_yet),
      CategoryEnum.memoryGame => picturesVideosWidget(
        category,
        screenWidth,
        pictures: true,
        memoryGame: true,
      ),
    };
  }

  Column quizWidget(CategoryModel category) {
    return Column(
      children: List.generate(
        category.quizGame!.length * 2 - 1,
        (index) {
          if (index.isEven) {
            int itemIndex = index ~/ 2;
            return ListTile(
              title: Text(category.quizGame![itemIndex].text),
            );
          } else {
            return kheasydevDivider(
              black: true,
              padding: const EdgeInsets.symmetric(vertical: 4),
            );
          }
        },
      ),
    );
  }

  Widget picturesVideosWidget(
    CategoryModel category,
    double screenWidth, {
    required bool pictures,
    bool memoryGame = false,
  }) {
    final double gridWidth = screenWidth * 0.8;
    return SizedBox(
      width: gridWidth,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: getWidgetCount(memoryGame, category),
        itemBuilder: (context, index) {
          final mediaUrl = getMediaUrl(memoryGame, category, index);
          // Decode at the cell size (3 columns), not the full photo size.
          final int cacheWidth =
              (gridWidth / 3 * MediaQuery.devicePixelRatioOf(context)).round();

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.black, width: 2),
            ),
            clipBehavior: Clip.hardEdge,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: pictures
                  ? CachedNetworkImage(
                      imageUrl: mediaUrl,
                      fit: BoxFit.cover,
                      memCacheWidth: cacheWidth,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey,
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : VideoThumbnailWidget(videoUrl: mediaUrl),
            ),
          );
        },
      ),
    );
  }

  Scrollbar textWidget(CategoryModel category) {
    return Scrollbar(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Text(
            category.text ?? "",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index == categories.length) {
          return const SizedBox(height: 28);
        }
        final category = categories[index];
        return Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: categoryCardWidget(context, category, bloc),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemCount: categories.length + 1,
    );
  }

  ListTile categoryCardWidget(
    BuildContext context,
    CategoryModel category,
    HomeBloc bloc,
  ) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.7,
        ),
        child: Text(
          category.displayTitle,
          style: AppTextStyle().description.copyWith(
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      trailing: IconButton(
        onPressed: () async {
          final Size screenSize = MediaQuery.sizeOf(context);
          final selectedAction = await selectedActionOnEyeDialog(
            context,
            category,
            screenSize.height,
            screenSize.width,
          );
          if (selectedAction == ActionsEnum.edit) {
            bloc.add(.addOrEditCategory(category, edit: true));
          } else if (selectedAction == ActionsEnum.delete) {
            if (!context.mounted) return;
            final userChoice = await showDialog<bool>(
              context: context,
              builder: (context) => generalDialog(
                title: t.sure_delete_name(
                  context: SessionService().gender,
                  text: category.displayTitle,
                ),
              ),
            );
            if (userChoice == true) {
              bloc.add(.deleteCategory(category));
            }
          }
        },
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }

  Future<ActionsEnum?> selectedActionOnEyeDialog(
    BuildContext context,
    CategoryModel category,
    double screenHeight,
    double screenWidth,
  ) {
    return showDialog<ActionsEnum>(
      context: context,
      builder: (context) => generalDialog(
        title: category.displayTitle,
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight * 0.7,
            child: Column(
              children: [
                kheasydevDivider(black: true),
                Expanded(
                  child: getCategoryWidget(context, category, screenWidth),
                ),
              ],
            ),
          ),
        ),
        buttons: [
          appButton(
            text: t.edit,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            onTap: () => Navigator.of(context).pop(ActionsEnum.edit),
          ),
          appButton(
            text: t.delete,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            onTap: () => Navigator.of(context).pop(ActionsEnum.delete),
          ),
          appButton(
            text: t.exit,
            unfillColors: true,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  String getMediaUrl(bool memoryGame, CategoryModel category, int index) {
    if (!memoryGame) {
      return category.urls?[index] ?? "";
    } else {
      return category.memoryGame?.imagesUrls[index] ?? "";
    }
  }

  int getWidgetCount(bool memoryGame, CategoryModel category) {
    if (!memoryGame) {
      return category.urls?.length ?? 0;
    } else {
      return category.memoryGame?.imagesUrls.length ?? 0;
    }
  }
}
