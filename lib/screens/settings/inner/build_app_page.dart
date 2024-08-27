import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/screens/home_screen/home_screen.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/widgets/navigate_page.dart';

//TODO: new page

class BuildAppPage extends StatefulWidget {
  final int loadingTime;
  final Widget? page;

  const BuildAppPage(this.loadingTime, {super.key, this.page});

  @override
  _BuildAppPageState createState() => _BuildAppPageState();
}

class _BuildAppPageState extends State<BuildAppPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  double _percentage = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.loadingTime),
      vsync: this,
    )..addListener(() {
        setState(() {
          _percentage = _controller.value * 100;
          if (_percentage == 100) {
            KheasydevNavigatePage()
                .pushAndRemoveUntil(context, widget.page ?? HomeScreen());
          }
        });
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "בונה את האפליקציה"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // appTranslate(context, 'app_build_now'),
              "TODO: add new text",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 15.0,
                value: _controller.value,
                backgroundColor: AppColor.disableColor,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Text(
              '${_percentage.toStringAsFixed(1)}%',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
