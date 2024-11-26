import 'dart:async';

import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/screens/wear_os/wear_design.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/screens/wear_os/wear_os_categories/bloc/wear_os_categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:rotary_scrollbar/widgets/rotary_scrollbar.dart';
import 'package:wearable_rotary/wearable_rotary.dart';

class WearOsCategories extends StatefulWidget {
  const WearOsCategories({super.key});

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
    return BlocProvider(
      create: (context) => WearOsCategoriesBloc(),
      child: BlocBuilder<WearOsCategoriesBloc, WearOsCategoriesState>(
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
                    Text(
                      t.greeter(context: globalGender, name: globalUser.name),
                      style: AppTextStyle().subTitle,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          bloc.add(WearOsCategoriesEventTest());
                        },
                        child: const Text("check")),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // controller: rotaryScrollController,
                        itemCount: 20,
                        separatorBuilder: (context, index) =>
                            kheasydevDivider(black: true),
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                          leading: Text(
                            'Item $index',
                            style: AppTextStyle().watchDescription,
                          ),
                          trailing: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.lock)),
                        ),
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
