import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/side_menu_v2.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.home_screen),
      drawer: appSideMenuV2(context, 'home'),
      body: Column(
        children: [],
      ),
    );
  }
}
