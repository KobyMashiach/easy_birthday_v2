import 'dart:async';

import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/language_dropdown.dart';
import 'package:easy_birthday/features/wear_os/presentation/bloc/wear_os_categories_bloc.dart';
import 'package:easy_birthday/features/wear_os/presentation/widgets/wear_category_card.dart';
import 'package:easy_birthday/features/wear_os/presentation/widgets/wear_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rotary_scrollbar/widgets/rotary_scrollbar.dart';
import 'package:wearable_rotary/wearable_rotary.dart';

class WearOsCategories extends StatefulWidget {
  final String eventId;
  const WearOsCategories({super.key, required this.eventId});

  @override
  State<WearOsCategories> createState() => _WearOsCategoriesState();
}

class _WearOsCategoriesState extends State<WearOsCategories> {
  final RotaryScrollController rotaryScrollController =
      RotaryScrollController();

  @override
  void dispose() {
    rotaryScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WearOsCategoriesBloc.fromContext(context)..add(.init(widget.eventId)),
      child: BlocConsumer<WearOsCategoriesBloc, WearOsCategoriesState>(
        listenWhen: (_, current) => current.isOneShot,
        buildWhen: (_, current) => !current.isOneShot,
        listener: (context, state) {
          switch (state) {
            case ErrorMessage():
              kheasydevAppToast(t.operation_not_allowed);
            case NavigateToLogin():
              context.goNamed(Routing.wearOsLogin);
            case Initial() || Loading() || Loaded() || LoadFailed():
              break;
          }
        },
        builder: (context, state) {
          final bloc = context.read<WearOsCategoriesBloc>();
          final event = state.event;
          return WearDesign(
            child: RotaryScrollbar(
              controller: rotaryScrollController,
              padding: 0,
              autoHideDuration: const Duration(seconds: 1),
              child: SingleChildScrollView(
                controller: rotaryScrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const _WatchClock(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LanguageDropdown(
                          onLanguageChange: () => setState(() {}),
                          size: 30,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(width: 24),
                        IconButton(
                          onPressed: () async {
                            final userChoice = await showDialog<bool>(
                              context: context,
                              builder: (dialogContext) => generalDialog(
                                title: t.sure_logout(
                                  context: GenderContext.male,
                                ),
                                noButtons: true,
                                buttons: [
                                  appButton(
                                    text: t.yes,
                                    onTap: () =>
                                        Navigator.of(dialogContext).pop(true),
                                  ),
                                  const SizedBox(width: 4),
                                  appButton(
                                    text: t.no,
                                    unfillColors: true,
                                    onTap: () =>
                                        Navigator.of(dialogContext).pop(),
                                  ),
                                ],
                              ),
                            );
                            if (userChoice == true) {
                              bloc.add(const .logout());
                            }
                          },
                          icon: const Icon(Icons.logout),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: event == null
                          ? state is LoadFailed
                                ? Text(t.operation_not_allowed)
                                : const CircularProgressIndicator.adaptive()
                          : event.categories.isEmpty
                          ? Text(t.no_category_added)
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: event.categories.length + 1,
                              separatorBuilder: (context, index) =>
                                  kheasydevDivider(black: true),
                              itemBuilder: (BuildContext context, int index) {
                                if (index == event.categories.length) {
                                  return const SizedBox(height: 40);
                                }
                                final category = event.categories[index];
                                return WearCategoryCard(
                                  category: category,
                                  onLockChanged: (lock) => bloc.add(
                                    .setLock(category, lock: lock),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// HH:mm clock that rebuilds only itself, once per minute boundary.
class _WatchClock extends StatefulWidget {
  const _WatchClock();

  @override
  State<_WatchClock> createState() => _WatchClockState();
}

class _WatchClockState extends State<_WatchClock> {
  Timer? _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _scheduleNextTick();
  }

  void _scheduleNextTick() {
    final now = DateTime.now();
    final nextMinute = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute + 1,
    );
    _timer = Timer(nextMinute.difference(now), () {
      if (!mounted) return;
      setState(() => _now = DateTime.now());
      _scheduleNextTick();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final time =
        "${_now.hour.toString().padLeft(2, '0')}:${_now.minute.toString().padLeft(2, '0')}";
    return Text(time, style: AppTextStyle().watchTitle);
  }
}
