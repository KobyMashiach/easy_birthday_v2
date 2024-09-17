import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/persona_functions.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ChooseTextsScreen extends StatefulWidget {
  const ChooseTextsScreen(
      {super.key, required this.onContinue, required this.onPrevious});

  final VoidCallback onContinue;
  final VoidCallback onPrevious;

  @override
  State<ChooseTextsScreen> createState() => _ChooseTextsScreenState();
}

class _ChooseTextsScreenState extends State<ChooseTextsScreen> {
  int? expandedIndex;
  final bool male = checkIfMaleGender(globalPartnerUser!.gender);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => widget.onPrevious(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (expandedIndex == index) {
                            expandedIndex = null;
                          } else {
                            expandedIndex = index;
                          }
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: expandedIndex != index
                              ? Radius.zero
                              : Radius.circular(30),
                          bottomLeft: expandedIndex != index
                              ? Radius.zero
                              : Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Container(
                          color: AppColors.primaryColor,
                          height: 80,
                          width: expandedIndex == index
                              ? double.infinity
                              : 60, // Change width conditionally
                          child: Row(
                            children: [
                              Text('Title $index'),
                              Expanded(
                                flex: 5,
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 300),
                                  transitionBuilder: (Widget child,
                                      Animation<double> animation) {
                                    return SizeTransition(
                                      sizeFactor: animation,
                                      axis: Axis.horizontal,
                                      child: child,
                                    );
                                  },
                                  child: expandedIndex == index
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                          ),
                                          child: Container(
                                            key: ValueKey<int>(index),
                                            height: 100,
                                            child: horizontalListViews(),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: AppButtonsBottomNavigationBar(
          activeButtonText: t.continue_,
          activeButtonOnTap: () async {
            widget.onContinue.call();
          },
          inactiveButtonText: t.back,
          inactiveButtonOnTap: widget.onPrevious,
        ),
      ),
    );
  }

  ListView horizontalListViews() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, i) {
        return Container(
          width: 100,
          margin: EdgeInsets.symmetric(horizontal: 5),
          color: Colors.blue,
          child: Center(
            child: Text('Item $i', style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}
