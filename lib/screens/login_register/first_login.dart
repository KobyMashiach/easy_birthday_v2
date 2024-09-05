import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';

class FirstLoginScreen extends StatelessWidget {
  const FirstLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(
          title: t.greeter(context: globalGender, name: globalUser.name)),
    );
  }
}
