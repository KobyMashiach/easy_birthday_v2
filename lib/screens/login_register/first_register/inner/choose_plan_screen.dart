import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/cards/choose_plan_card.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ChoosePlanScreen extends StatefulWidget {
  const ChoosePlanScreen(
      {super.key, required this.onContinue, required this.onPrevious});

  final VoidCallback onContinue;
  final VoidCallback onPrevious;

  @override
  _ChoosePlanScreenState createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  final PageController _pageController =
      PageController(viewportFraction: 0.8, initialPage: 1);

  int _selectedPlanIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: PageView.builder(
            itemCount: 3,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedPlanIndex = index;
              });
            },
            itemBuilder: (context, index) {
              bool isSelected = _selectedPlanIndex == index;

              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: EdgeInsets.symmetric(horizontal: 8.0).copyWith(
                  top: isSelected ? 0 : 40,
                  bottom: isSelected ? 0 : 40,
                ),
                padding: EdgeInsets.all(isSelected ? 16.0 : 12.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blueGrey : Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedPlanIndex = index;
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  child: Opacity(
                    opacity: isSelected ? 1.0 : 0.3,
                    child: ChoosePlanListView(
                      title: index == 0
                          ? 'Basic'
                          : index == 1
                              ? 'Enterprise'
                              : 'Startup',
                      price: index == 0
                          ? '10\$'
                          : index == 1
                              ? '35\$'
                              : '24\$',
                      features: index == 0
                          ? ['Feature 1', 'Feature 2', 'Feature 3']
                          : index == 1
                              ? [
                                  'Feature 1',
                                  'Feature 2',
                                  'Feature 3',
                                  'Feature 4'
                                ]
                              : ['Feature 1', 'Feature 2', 'Feature 3'],
                      isSelected: isSelected,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonText: t.finish,
        activeButtonOnTap: () async {
          widget.onContinue.call();
        },
        inactiveButtonText: t.back,
        inactiveButtonOnTap: widget.onPrevious,
      ),
    );
  }
}
