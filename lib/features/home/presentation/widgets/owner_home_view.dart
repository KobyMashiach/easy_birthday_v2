import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_birthday/core/widgets/animations/staggered_entrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:easy_birthday/features/category_display/presentation/widgets/coupons/coupon_ticket.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/look_alike/look_alike_widgets.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/stats/parent_stat_texts.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/look_alike_model.dart';
import 'package:easy_birthday/features/event/data/models/milestone_model.dart';
import 'package:easy_birthday/features/event/data/models/parent_stat.dart';
import 'package:easy_birthday/features/home/presentation/bloc/home_bloc.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
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
      CategoryEnum.babyLetter => textWidget(category),
      CategoryEnum.timeCapsule => _previewList([
        if (category.timeCapsule case final capsule?) ...[
          "🔒 ${t.capsule_opens_at(date: dateTimeToString(capsule.openDate))}",
          if (capsule.partnerLetter?.isNotEmpty ?? false)
            t.capsule_partner_sealed(
              name: SessionService().partner?.name ?? '',
            ),
          capsule.ownerLetter ?? "",
        ],
      ]),
      CategoryEnum.parentCoupons =>
        category.wishesList?.lock ?? false
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    for (final (i, text) in [
                      category.wishesList?.first,
                      category.wishesList?.second,
                      category.wishesList?.third,
                    ].indexed)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CouponTicket(
                          text: text ?? "",
                          number: i + 1,
                          redeemed: category.wishesList!.redeemed.contains(i),
                        ),
                      ),
                  ],
                ),
              )
            : Text(t.no_wish_yet),
      CategoryEnum.parentStats => _previewList([
        for (final (stat, daily) in ParentStat.active(category.parentStats))
          "${stat.emoji} ${stat.totalLabel}: ${formatStatNumber(parentStatTotalFor(daily, childrenOf(category)))}",
      ]),
      CategoryEnum.milestones => _previewList([
        for (final milestone in category.milestones ?? const <MilestoneModel>[])
          "${milestone.emoji} ${milestone.title} · ${dateTimeToString(milestone.date)}",
      ]),
      CategoryEnum.lookAlike => _previewList([
        if (category.lookAlike case final lookAlike?)
          for (final child in childrenOf(category))
            if (lookAlike.lock)
              "${child.emoji} ${child.name}: ${_lookAlikeScoreText(lookAlike, child.id)}"
            else
              "${child.emoji} ${child.name}: ${t.not_played_yet}",
      ]),
    };
  }

  String _lookAlikeScoreText(LookAlikeModel lookAlike, String childId) {
    final names = lookAlikeParentNames();
    final (owner, partner) = lookAlikeScore(lookAlike.partnerAnswers, childId);
    return "${names.owner} $owner : $partner ${names.partner}";
  }

  Widget _previewList(List<String> lines) {
    if (lines.isEmpty) return Text(t.nothing_here_yet);
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final line in lines)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(line),
              ),
          ],
        ),
      ),
    );
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
    return ReorderableListView.builder(
      // Room for the add button below the last card.
      padding: const EdgeInsets.only(bottom: 80),
      buildDefaultDragHandles: false,
      header: categories.length > 1
          ? Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                t.drag_to_reorder(
                  context: SessionService().gender,
                  name: SessionService().partner?.name ?? '',
                ),
                textAlign: TextAlign.center,
                style: AppTextStyle().smallDescription.copyWith(
                  color: Colors.black54,
                ),
              ),
            )
          : null,
      proxyDecorator: (child, index, animation) => AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final double lift = Curves.easeOut.transform(animation.value);
          return Transform.scale(
            scale: 1 + lift * 0.04,
            child: Material(
              color: Colors.transparent,
              elevation: lift * 10,
              shadowColor: Colors.black45,
              borderRadius: BorderRadius.circular(12),
              child: child,
            ),
          );
        },
        child: child,
      ),
      onReorder: (oldIndex, newIndex) {
        final List<String> ids = [for (final c in categories) c.id ?? ''];
        // The list reports the index before removing the moved item.
        if (newIndex > oldIndex) newIndex--;
        if (newIndex == oldIndex) return;
        HapticFeedback.selectionClick();
        ids.insert(newIndex, ids.removeAt(oldIndex));
        bloc.add(.reorderCategories(ids));
      },
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Padding(
          key: ValueKey(category.id),
          padding: const EdgeInsets.only(bottom: 20),
          // A long press anywhere also picks the card up.
          child: ReorderableDelayedDragStartListener(
            index: index,
            child: StaggeredEntrance(
              index: index,
              child: Container(
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
                child: categoryCardWidget(context, category, bloc, index),
              ),
            ),
          ),
        );
      },
    );
  }

  ListTile categoryCardWidget(
    BuildContext context,
    CategoryModel category,
    HomeBloc bloc,
    int index,
  ) {
    return ListTile(
      contentPadding: const EdgeInsetsDirectional.only(start: 4, end: 12),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ReorderableDragStartListener(
            index: index,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.drag_indicator,
                semanticLabel: t.reorder,
                color: Colors.black54,
              ),
            ),
          ),
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.white,
            child: Text(
              "${index + 1}",
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.disableColor,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        category.displayTitle,
        style: AppTextStyle().description.copyWith(
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
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
