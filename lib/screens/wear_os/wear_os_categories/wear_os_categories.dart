import 'dart:async';

import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/hive/general_data_source.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/screens/wear_os/wear_design.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/screens/wear_os/wear_os_categories/bloc/wear_os_categories_bloc.dart';
import 'package:easy_birthday/screens/wear_os/wear_os_login.dart';
import 'package:easy_birthday/widgets/cards/wear_category_card.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:rotary_scrollbar/widgets/rotary_scrollbar.dart';
import 'package:wearable_rotary/wearable_rotary.dart';

class WearOsCategories extends StatefulWidget {
  final String eventId;
  const WearOsCategories({super.key, required this.eventId});

  @override
  State<WearOsCategories> createState() => _WearOsCategoriesState();
}

class _WearOsCategoriesState extends State<WearOsCategories> {
  late Timer _timer;
  late DateTime _currentTime;
  late RotaryScrollController rotaryScrollController;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _startTimer();
    rotaryScrollController = RotaryScrollController();
  }

  @override
  void dispose() {
    _timer.cancel();
    rotaryScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => EventRepo(),
        ),
        RepositoryProvider(
          create: (context) => GeneralDataSource(),
        ),
      ],
      child: BlocProvider(
        create: (context) => WearOsCategoriesBloc(
            eventRepo: context.read<EventRepo>(),
            generalDataSource: context.read<GeneralDataSource>())
          ..add(WearOsCategoriesEventInit(eventId: widget.eventId)),
        child: BlocConsumer<WearOsCategoriesBloc, WearOsCategoriesState>(
          listenWhen: (previous, current) =>
              current is WearOsCategoriesNavigate,
          buildWhen: (previous, current) =>
              current is! WearOsCategoriesNavigate,
          listener: (context, state) {
            if (state is WearOsCategoriesOnLogout) {
              KheasydevNavigatePage()
                  .pushAndRemoveUntil(context, const WearOSLoginPage());
            }
          },
          builder: (context, state) {
            final bloc = context.read<WearOsCategoriesBloc>();
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
                      Text(_getCurrentTime(), style: AppTextStyle().watchTitle),
                      IconButton(
                          onPressed: () async {
                            final userChoise = await showDialog(
                              context: context,
                              builder: (context) => generalDialog(
                                  title: t.sure_logout(
                                      context: GenderContext.male),
                                  noButtons: true,
                                  buttons: [
                                    appButton(
                                        text: t.yes,
                                        onTap: () => KheasydevNavigatePage()
                                            .pop(context, value: true)),
                                    const SizedBox(width: 4),
                                    appButton(
                                        text: t.no,
                                        unfillColors: true,
                                        onTap: () => KheasydevNavigatePage()
                                            .pop(context)),
                                  ]),
                            );
                            if (userChoise) {
                              bloc.add(WearOsCategoriesEventOnLogout());
                            }
                          },
                          icon: const Icon(Icons.logout)),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: globalEvent == null
                            ? const CircularProgressIndicator()
                            : globalEvent!.categories.isEmpty
                                ? Text(t.no_category_added)
                                : ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        globalEvent!.categories.length + 1,
                                    separatorBuilder: (context, index) =>
                                        kheasydevDivider(black: true),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index ==
                                          globalEvent!.categories.length) {
                                        return const SizedBox(height: 40);
                                      }
                                      final category =
                                          globalEvent!.categories[index];
                                      return WearCategoryCard(
                                        category: category,
                                        onLockPress: () => bloc.add(
                                            WearOsCategoriesEventOnLockPress(
                                                category: category)),
                                      );
                                    }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  String _getCurrentTime() {
    return "${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}";
  }
}
