import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/coupons/coupon_ticket.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/display_screens_top.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/empty_category_view.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
import 'package:flutter/material.dart';

/// Parenting coupons: the wishes list logic (the partner picks 3 coupons
/// under the owner's contract and locks them), shown as tear-off tickets.
/// Tearing a ticket's stub redeems it.
class DisplayParentCoupons extends StatefulWidget {
  const DisplayParentCoupons({
    super.key,
    required this.category,
    required this.onDone,
  });

  final CategoryModel category;
  final void Function(WishesModel wishesList) onDone;

  @override
  State<DisplayParentCoupons> createState() => _DisplayParentCouponsState();
}

class _DisplayParentCouponsState extends State<DisplayParentCoupons> {
  late final List<TextEditingController> controllers = [
    TextEditingController(text: widget.category.wishesList?.first),
    TextEditingController(text: widget.category.wishesList?.second),
    TextEditingController(text: widget.category.wishesList?.third),
  ];

  late WishesModel? _coupons = widget.category.wishesList;

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  WishesModel _withTexts(WishesModel coupons) => coupons.copyWith(
    first: controllers[0].text,
    second: controllers[1].text,
    third: controllers[2].text,
  );

  bool get _allFilled => controllers.every((c) => c.text.trim().isNotEmpty);

  void _redeem(int index) {
    final WishesModel coupons = _coupons!;
    if (coupons.redeemed.contains(index)) return;
    final WishesModel updated = coupons.copyWith(
      redeemed: [...coupons.redeemed, index],
    );
    setState(() => _coupons = updated);
    widget.onDone(updated);
  }

  void _addSuggestion(String suggestion) {
    final TextEditingController? empty = controllers
        .where((c) => c.text.trim().isEmpty)
        .firstOrNull;
    if (empty == null) return;
    setState(() => empty.text = suggestion);
  }

  @override
  Widget build(BuildContext context) {
    final WishesModel? coupons = _coupons;
    if (coupons == null) return EmptyCategoryView(category: widget.category);
    return Scaffold(
      appBar: appAppBar(title: widget.category.displayTitle),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DisplayScreensTop(category: widget.category),
            if (coupons.lock) ..._tickets(coupons) else ..._editor(coupons),
          ],
        ),
      ),
      bottomNavigationBar: coupons.lock
          ? null
          : AppButtonsBottomNavigationBar(
              middleButton: true,
              middleButtonText: t.save,
              middleButtonOnTap: () {
                widget.onDone(_withTexts(coupons));
                context.popIfPossible();
              },
              activeButtonText: t.save_and_print_coupons,
              activeButtonDisable: !_allFilled,
              activeButtonOnTap: _allFilled
                  ? () {
                      final WishesModel locked = _withTexts(
                        coupons,
                      ).copyWith(lock: true);
                      setState(() => _coupons = locked);
                      widget.onDone(locked);
                    }
                  : null,
            ),
    );
  }

  List<Widget> _tickets(WishesModel coupons) {
    final List<String> texts = [
      coupons.first ?? "",
      coupons.second ?? "",
      coupons.third ?? "",
    ];
    final int left = 3 - coupons.redeemed.length;
    return [
      Text(
        left == 0 ? t.all_coupons_redeemed : t.coupons_left(n: left),
        style: AppTextStyle().title,
        textAlign: TextAlign.center,
      ),
      Text(
        t.tear_coupon_explanation(
          context: SessionService().gender,
          name: SessionService().partner?.name ?? '',
        ),
        style: AppTextStyle().smallDescription,
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 20),
      for (int i = 0; i < texts.length; i++)
        Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: CouponTicket(
            text: texts[i],
            number: i + 1,
            redeemed: coupons.redeemed.contains(i),
            onRedeem: () => _redeem(i),
          ),
        ),
    ];
  }

  List<Widget> _editor(WishesModel coupons) {
    return [
      appButton(
        text: t.please_read_contract(
          context: SessionService().gender,
          name: SessionService().partner?.name ?? '',
        ),
        margin: const EdgeInsets.all(12),
        onTap: () => showDialog<void>(
          context: context,
          builder: (context) =>
              generalDialog(oneButton: true, description: coupons.contract),
        ),
      ),
      Text(
        t.choose_coupons(context: SessionService().gender),
        style: AppTextStyle().description,
        textAlign: TextAlign.center,
      ),
      for (int i = 0; i < controllers.length; i++)
        AppTextField(
          hintText: t.coupon_number(n: i + 1),
          maxLength: 40,
          maxLines: 2,
          controller: controllers[i],
          onChanged: (_) => setState(() {}),
        ),
      const SizedBox(height: 8),
      Text(t.coupon_ideas, style: AppTextStyle().smallDescription),
      const SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          for (final idea in _ideas)
            ActionChip(
              label: Text(idea),
              labelStyle: AppTextStyle().dropDownValues,
              backgroundColor: AppColors.greyLightDisableColor,
              onPressed: _allFilled ? null : () => _addSuggestion(idea),
            ),
        ],
      ),
    ];
  }

  List<String> get _ideas => [
    t.coupon_idea_full_night,
    t.coupon_idea_sleep_in,
    t.coupon_idea_date_night,
    t.coupon_idea_long_shower,
    t.coupon_idea_diaper_pass,
    t.coupon_idea_breakfast_in_bed,
    t.coupon_idea_massage,
    t.coupon_idea_friends_night,
  ];
}
