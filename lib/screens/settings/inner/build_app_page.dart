import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/screens/settings/setting_screen.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/widgets/navigate_page.dart';

class BuildAppPage extends StatefulWidget {
  final int loadingTime;
  final Widget? page;
  final String? description;

  const BuildAppPage(this.loadingTime,
      {super.key, this.page, this.description});

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
        });

        if (_percentage == 100) {
          KheasydevNavigatePage()
              .pushAndRemoveUntil(context, widget.page ?? SettingsScreen());
        }
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
      appBar: appAppBar(title: t.build_app),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              t.build_app_description,
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 15.0,
                    value: _controller.value,
                    backgroundColor: AppColors.disableColor,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                  ),
                ),
                Text(
                  '${_percentage.toStringAsFixed(1)}%',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.description ?? "",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
