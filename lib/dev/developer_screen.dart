import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/hive/hive_functions.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/models/plan_model/plan_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/screens/home/home_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/first_register_main.dart';
import 'package:easy_birthday/screens/login_register/login/login_screen.dart';
import 'package:easy_birthday/services/firebase/firebase_auth.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  List<Map<String, dynamic>> settingsOptions(BuildContext context) {
    final List<Map<String, dynamic>> settingOptions = [
      {
        'title': "Clear all hive boxes",
        'icon': Icons.storage_rounded,
        'function': () async {
          final userChoise = await deleteSomethingDialog(context);
          if (userChoise == true) {
            clearAllHiveBoxes();
            log("All local storage deleted!");
          }
        }
      },
      {
        'title': "Remove all catch and storage",
        'icon': Icons.storage_rounded,
        'function': () async {
          final userChoise = await deleteSomethingDialog(context);
          if (userChoise == true) {
            removeAllStorageAndCatch();
            log("All local storage deleted!");
          }
        }
      },
      {
        'title': "Change my role",
        'icon': Icons.admin_panel_settings_outlined,
        'function': () async => await changeRoleFunction(context)
      },
      {
        'title': "Change my plan",
        'icon': Icons.admin_panel_settings_outlined,
        'function': () async => await changePlanFunction(context)
      },
      {
        'title': "Navigate to Home screen",
        'icon': Icons.navigation_outlined,
        'function': () {
          KheasydevNavigatePage().push(context, const HomeScreen());
        }
      },
      {
        'title': "Navigate to Login screen",
        'icon': Icons.navigation_outlined,
        'function': () {
          KheasydevNavigatePage().push(context, const LoginScreen());
        }
      },
      {
        'title': "Navigate to First register screen",
        'icon': Icons.navigation_outlined,
        'function': () {
          KheasydevNavigatePage().push(context, const FirstRegisterMain());
        }
      },
      {
        'title': "Logout from user",
        'icon': Icons.logout,
        'function': () async {
          final userChoise =
              await deleteSomethingDialog(context, text: "Logout from user?");
          if (userChoise == true) {
            await logoutFirestore();
          }
        }
      },
    ];
    return settingOptions;
  }

  Future<dynamic> deleteSomethingDialog(BuildContext context, {String? text}) {
    return showDialog(
      context: context,
      builder: (context) =>
          generalDialog(title: text ?? "Delete all local storage?"),
    );
  }

  Future<dynamic> changePlanFunction(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => generalDialog(
        title: "Choose plan to change",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: appPlans.values
              .map((plan) => GestureDetector(
                    onTap: () async {
                      context.read<EventRepo>().updateEvent(
                          globalEvent!.copyWith(planSubscribe: plan));
                      KheasydevNavigatePage().pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Text(
                          plan.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Future<dynamic> changeRoleFunction(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => generalDialog(
        title: "Choose role to change",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: RoleModel.values
              .map((role) => GestureDetector(
                    onTap: () async {
                      await context
                          .read<PersonaRepo>()
                          .updatePersona(globalUser.copyWith(role: role));

                      KheasydevNavigatePage().pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Text(
                          role.getName(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final settingOptions = settingsOptions(context);
    return Scaffold(
      appBar: appAppBar(title: "Developer Screen"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: settingOptions.length,
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemBuilder: (context, index) {
            return Card(
              child: GestureDetector(
                onTap: () => settingOptions[index]['function'](),
                child: ListTile(
                  leading: Icon(settingOptions[index]['icon']),
                  title: Text(settingOptions[index]['title'].toString()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
