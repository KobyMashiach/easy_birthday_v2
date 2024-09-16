import 'package:easy_birthday/i18n/strings.g.dart';
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
  int _selectedPlanIndex = 1; // Start from the middle index
  final PageController _pageController =
      PageController(viewportFraction: 0.7, initialPage: 1);

  Widget buildPlanContainer({
    required String title,
    required String price,
    required List<String> features,
    required bool isSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          price,
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        SizedBox(height: 16.0),
        ...features.map((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check,
                    color: isSelected ? Colors.pink : Colors.grey,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    feature,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            )),
        Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          onPressed: () {},
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Stack(
            children: [
              PageView.builder(
                itemCount: 3,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedPlanIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  bool isSelected = _selectedPlanIndex == index;

                  return Positioned(
                    top: isSelected ? 0 : 12, // Adjust the vertical position
                    left: 0,
                    right: 0,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: EdgeInsets.symmetric(horizontal: 8.0).copyWith(
                        top: isSelected ? 0 : 20,
                        bottom: isSelected ? 20 : 40,
                      ),
                      padding: EdgeInsets.all(isSelected ? 16.0 : 12.0),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blueGrey : Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
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
                          });
                        },
                        child: Opacity(
                          opacity: isSelected ? 1.0 : 0.7,
                          child: buildPlanContainer(
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
                    ),
                  );
                },
              ),
            ],
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
