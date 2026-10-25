import 'dart:math' as math;

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/widgets/animations/staggered_entrance.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/display_screens_top.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/empty_category_view.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DisplayWishesList extends StatefulWidget {
  const DisplayWishesList({
    super.key,
    required this.category,
    required this.onDone,
  });

  final CategoryModel category;
  final void Function(WishesModel wishesList) onDone;

  @override
  State<DisplayWishesList> createState() => _DisplayWishesListState();
}

class _DisplayWishesListState extends State<DisplayWishesList> {
  final TextEditingController firstWish = TextEditingController();
  final TextEditingController secondWish = TextEditingController();
  final TextEditingController thirdWish = TextEditingController();

  WishesModel? _wishesList;
  WishesModel get wishesList => _wishesList!;
  set wishesList(WishesModel value) => _wishesList = value;

  @override
  void initState() {
    super.initState();
    _wishesList = widget.category.wishesList;
    if (_wishesList != null) _initControllers();
  }

  @override
  void dispose() {
    firstWish.dispose();
    secondWish.dispose();
    thirdWish.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_wishesList == null) {
      return EmptyCategoryView(category: widget.category);
    }
    final bool allFieldsComplete = checkAllFieldsComplete();
    return Scaffold(
      appBar: appAppBar(
        title: widget.category.displayTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DisplayScreensTop(category: widget.category),
                wishesList.lock
                    // At least a screen high (texts vertically centered, as
                    // before) but grows instead of overflowing in landscape /
                    // large text.
                    ? ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.sizeOf(context).height,
                        ),
                        child: Row(
                          children: [
                            // Expanded lets long texts wrap instead of
                            // overflowing the row.
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.wish_list_lock_title,
                                    style: AppTextStyle().title,
                                  ),
                                  Text(
                                    t.wish_list_lock_description(
                                      name:
                                          SessionService().partner?.name ?? '',
                                    ),
                                    style: AppTextStyle().description,
                                  ),
                                  const SizedBox(height: 16),
                                  const Center(child: _FloatingGenie()),
                                  const SizedBox(height: 8),
                                  for (final (index, wish) in [
                                    wishesList.first,
                                    wishesList.second,
                                    wishesList.third,
                                  ].indexed)
                                    StaggeredEntrance(
                                      index: index + 2,
                                      fromScale: 0.8,
                                      child: _WishCard(
                                        number: index + 1,
                                        text: wish ?? "",
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          appButton(
                            text: t.please_read_contract(
                              context: SessionService().gender,
                              name: SessionService().partner?.name ?? '',
                            ),
                            margin: const EdgeInsets.all(12),
                            onTap: () => showDialog<void>(
                              context: context,
                              builder: (context) => generalDialog(
                                oneButton: true,
                                description: wishesList.contract,
                              ),
                            ),
                          ),
                          const _FloatingGenie(),
                          for (final (index, (hint, controller)) in [
                            (t.first_wish, firstWish),
                            (t.second_wish, secondWish),
                            (t.third_wish, thirdWish),
                          ].indexed)
                            StaggeredEntrance(
                              index: index,
                              child: Row(
                                children: [
                                  _StarBadge(number: index + 1),
                                  Expanded(
                                    child: wishTextField(
                                      hintText: hint,
                                      controller: controller,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: wishesList.lock
          ? null
          : AppButtonsBottomNavigationBar(
              middleButton: true,
              middleButtonText: t.save,
              middleButtonOnTap: () {
                saveTextFields(lock: false);
                widget.onDone(wishesList);
                _close();
              },
              activeButtonText: t.save_and_lock,
              activeButtonOnTap: allFieldsComplete
                  ? () {
                      saveTextFields(lock: true);
                      widget.onDone(wishesList);
                      _close();
                    }
                  : null,
              activeButtonDisable: !allFieldsComplete,
            ),
    );
  }

  void _close() {
    if (context.canPop()) {
      context.pop();
    } else {
      Navigator.of(context).maybePop();
    }
  }

  AppTextField wishTextField({
    required String hintText,
    required TextEditingController controller,
  }) {
    return AppTextField(
      hintText: hintText,
      maxLength: 30,
      maxLines: 2,
      readOnly: wishesList.lock,
      controller: controller,
      onChanged: (value) => setState(() {}),
    );
  }

  void saveTextFields({required bool lock}) {
    wishesList = wishesList.copyWith(
      first: firstWish.text,
      second: secondWish.text,
      third: thirdWish.text,
    );
    if (lock) {
      wishesList = wishesList.copyWith(lock: true);
    }
  }

  bool checkAllFieldsComplete() {
    if (firstWish.text.isEmpty) return false;
    if (secondWish.text.isEmpty) return false;
    if (thirdWish.text.isEmpty) return false;
    return true;
  }

  void _initControllers() {
    firstWish.text = wishesList.first ?? "";
    secondWish.text = wishesList.second ?? "";
    thirdWish.text = wishesList.third ?? "";
  }
}

/// A genie bobbing over the wishes.
class _FloatingGenie extends StatefulWidget {
  const _FloatingGenie();

  @override
  State<_FloatingGenie> createState() => _FloatingGenieState();
}

class _FloatingGenieState extends State<_FloatingGenie>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double v = Curves.easeInOut.transform(_controller.value);
        return Transform.translate(
          offset: Offset(0, -8 * v),
          child: Transform.rotate(angle: (v - 0.5) * 0.12, child: child),
        );
      },
      child: const Text("🧞", style: TextStyle(fontSize: 56)),
    );
  }
}

/// The wish's number on a star.
class _StarBadge extends StatelessWidget {
  final int number;
  const _StarBadge({required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(Icons.star_rounded, color: Colors.amber, size: 40),
          Text(
            "$number",
            textScaler: TextScaler.noScaling,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/// A granted wish: a glowing card with twinkling stars.
class _WishCard extends StatefulWidget {
  final int number;
  final String text;
  const _WishCard({required this.number, required this.text});

  @override
  State<_WishCard> createState() => _WishCardState();
}

class _WishCardState extends State<_WishCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _twinkle;

  @override
  void initState() {
    super.initState();
    _twinkle = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1600 + widget.number * 300),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _twinkle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = AppColors.primaryColor;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color,
            HSLColor.fromColor(
              color,
            ).withHue((HSLColor.fromColor(color).hue + 40) % 360).toColor(),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 12),
        ],
      ),
      child: Row(
        children: [
          _StarBadge(number: widget.number),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.text,
              style: AppTextStyle().description.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _twinkle,
            builder: (context, child) => Opacity(
              opacity: 0.3 + 0.7 * _twinkle.value,
              child: Transform.rotate(
                angle: _twinkle.value * math.pi / 4,
                child: child,
              ),
            ),
            child: const Text("✨", style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
