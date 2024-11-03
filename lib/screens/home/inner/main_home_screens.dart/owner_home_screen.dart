import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/enums.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/main.dart';
import 'package:easy_birthday/models/calendar_model/date_event_model/date_event_model.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/screens/home/bloc/home_screen_bloc.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/widgets/general/video_thumbnail_widget.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  Widget getCategoryWidget(CategoryModel category, double screenWidth) {
    return switch (category.categoryType) {
      CategoryEnum.text => textWidget(category),
      CategoryEnum.pictures =>
        picturesVideosWidget(category, screenWidth, pictures: true),
      CategoryEnum.videos =>
        picturesVideosWidget(category, screenWidth, pictures: false),
      CategoryEnum.quizGame =>
        category.quizGame != null && category.quizGame!.isNotEmpty
            ? quizWidget(category)
            : Text(t.no_questions_add),
      CategoryEnum.birthdayCalendar => Row(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: category.calendarEvents != null
                    ? category.calendarEvents!.dateEventMap.entries
                        .map((entry) {
                        DateTime dateTime = entry.key;
                        List<DateEventModel> eventList = entry.value;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('dd/MM/yyyy').format(dateTime),
                                style: AppTextStyle()
                                    .description
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              ...eventList.map((event) {
                                return Text(
                                    '${event.time.format(NavigationContextService.navigatorKey.currentContext!)} - ${event.description}',
                                    style: AppTextStyle().smallDescription);
                              }),
                            ],
                          ),
                        );
                      }).toList()
                    : []),
          ],
        ),
      CategoryEnum.birthdaySuprise =>
        Column(children: supriseMapToWidgets(category.supriseMap)),
      CategoryEnum.wishesList => category.wishesList?.lock ?? false
          ? Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1. ${category.wishesList?.first ?? ""}"),
                    Text("2. ${category.wishesList?.second ?? ""}"),
                    Text("3. ${category.wishesList?.third ?? ""}"),
                  ],
                ),
              ],
            )
          : Text(t.no_wish_yet),
      CategoryEnum.memoryGame => picturesVideosWidget(category, screenWidth,
          pictures: true, memoryGame: true),
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

  Widget picturesVideosWidget(CategoryModel category, double screenWidth,
      {required bool pictures, bool memoryGame = false}) {
    return SizedBox(
      width: screenWidth * 0.8,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: getWidgetCount(memoryGame, category),
        itemBuilder: (context, index) {
          final mediaUrl = getMediaUrl(memoryGame, category, index);

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            clipBehavior: Clip.hardEdge,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: pictures
                  ? CachedNetworkImage(
                      imageUrl: mediaUrl,
                      fit: BoxFit.cover,
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
    final bloc = context.read<HomeScreenBloc>();
    return ListView.separated(
      itemBuilder: (context, index) {
        final category = globalEvent!.categories[index];
        return Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
              ],
            ),
            child: categoryCardWidget(context, category, bloc));
      },
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemCount: globalEvent!.categories.length,
    );
  }

  ListTile categoryCardWidget(
      BuildContext context, CategoryModel category, HomeScreenBloc bloc) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          category.titleAppear!,
          style:
              AppTextStyle().description.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      trailing: IconButton(
        onPressed: () async {
          final screenHeight = MediaQuery.of(context).size.height;
          final screenWidth = MediaQuery.of(context).size.height;
          final selectedAction = await selectedActionOnEyeDialog(
              context, category, screenHeight, screenWidth);
          if (selectedAction == ActionsEnum.edit) {
            bloc.add(HomeScreenEventAddOrEditCategory(
                category: category, edit: true));
          } else if (selectedAction == ActionsEnum.delete) {
            final userChoise = await showDialog(
                context: context,
                builder: (context) => generalDialog(
                    title: t.sure_delete_name(
                        context: globalGender, text: category.titleAppear!)));
            if (userChoise == true) {
              bloc.add(
                  HomeScreenEventDeleteCategoryInEvent(category: category));
            }
          }
        },
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }

  Future<dynamic> selectedActionOnEyeDialog(BuildContext context,
      CategoryModel category, double screenHeight, double screenWidth) {
    return showDialog(
      context: context,
      builder: (context) => generalDialog(
        title: category.titleAppear!,
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight * 0.7,
            child: Column(
              children: [
                kheasydevDivider(black: true),
                Expanded(child: getCategoryWidget(category, screenWidth)),
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
