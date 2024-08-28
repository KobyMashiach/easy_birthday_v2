import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/hive/app_settings_data_source.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/repos/app_settings_repo.dart';
import 'package:easy_birthday/screens/settings/bloc/settings_screen_bloc.dart';
import 'package:easy_birthday/screens/settings/inner/app_info.dart';
import 'package:easy_birthday/screens/settings/inner/build_app_page.dart';
import 'package:easy_birthday/screens/settings/inner/change_language_screen.dart';
import 'package:easy_birthday/screens/settings/inner/sex_change.dart';
import 'package:easy_birthday/widgets/dialogs/color_picker_dialog.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/onwillpop.dart';
import 'package:easy_birthday/widgets/general/side_menu_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/widgets/navigate_page.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (value, result) => appOnwillpop(context),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AppSettingsDataSource(),
          ),
          RepositoryProvider(
            create: (context) =>
                AppSettingsRepo(context.read<AppSettingsDataSource>()),
          ),
        ],
        child: BlocProvider(
          create: (context) =>
              SettingsScreenBloc(context.read<AppSettingsRepo>())
                ..add(SettingsScreenEventInit()),
          child: BlocConsumer<SettingsScreenBloc, SettingsScreenState>(
            listenWhen: (previous, current) =>
                current is SettingsScreenNavigateState,
            buildWhen: (previous, current) =>
                current is! SettingsScreenNavigateState,
            listener: (context, state) async {
              final bloc = context.read<SettingsScreenBloc>();

              switch (state.runtimeType) {
                case const (SettingsScreenNavigateOpenColorPicker):
                  await showDialog(
                    context: context,
                    builder: (context) => ColorPickerWidget(
                      initialColor: AppColors.primaryColor,
                      onColorChanged: (color) {
                        bloc.add(SettingsScreenEventChangeColor(color: color));
                      },
                    ),
                  );
                case const (SettingsScreenNavigateToBuildAppPage):
                  KheasydevNavigatePage().push(
                      context, BuildAppPage(1, description: t.change_color));
                case const (SettingsScreenNavigateToSexChangePage):
                  KheasydevNavigatePage()
                      .push(context, SexChange(settings: true));
                case const (SettingsScreenNavigateToChangeLanguage):
                  KheasydevNavigatePage().push(context, ChangeLanguageScreen());
                case const (SettingsScreenNavigateToAppInfoPage):
                  KheasydevNavigatePage().push(context, AppInfo());
              }
            },
            builder: (context, state) {
              final bloc = context.read<SettingsScreenBloc>();
              List<Map<String, dynamic>> settingOptions =
                  settingsOptions(context, bloc);

              return Scaffold(
                appBar: appAppBar(title: t.settings),
                drawer: appSideMenuV2(context, 'settings'),
                body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.separated(
                    itemCount: settingOptions.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      return Card(
                        child: GestureDetector(
                          onTap: () => settingOptions[index]['function'](),
                          child: ListTile(
                            leading: Icon(settingOptions[index]['icon']),
                            title:
                                Text(settingOptions[index]['title'].toString()),
                            trailing: settingOptions[index]['hintWidget'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> settingsOptions(
      BuildContext context, SettingsScreenBloc bloc) {
    final List<Map<String, dynamic>> settingOptions = [
      {
        'title': t.change_color,
        'icon': Icons.color_lens_outlined,
        'hintWidget': CircleAvatar(backgroundColor: AppColors.primaryColor),
        'function': () => bloc.add(SettingsScreenEventOpenAppColorDialog())
      },
      {
        'title': t.change_sex,
        'icon': Icons.man_2_outlined,
        'hintWidget': Icon(Icons.male, color: Colors.blue),
        'function': () async =>
            bloc.add(SettingsScreenEventNavigateToSexChange()),
      },
      {
        'title': t.change_language,
        'icon': Icons.language_outlined,
        'hintWidget': Text("data"),
        'function': () async =>
            bloc.add(SettingsScreenEventNavigateToChangeLanguage()),
      },
      {
        'title': t.app_info,
        'icon': Icons.info_outline,
        'function': () async =>
            bloc.add(SettingsScreenEventNavigateToAppInfo()),
      },
    ];
    return settingOptions;
  }
}
