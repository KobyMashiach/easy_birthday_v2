import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/utils/gender_utils.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final session = SessionService();
    final partner = session.partner;
    final nextAge = calculateNextAge();
    final appInfo = <String, String>{
      t.app_name: session.appName,
      t.app_version: 'v${session.appVersion}',
      t.event_id: session.event?.eventId ?? t.empty,
      t.current_plan: (session.event?.planSubscribe ?? getPlan(PlansEnum.free))
          .displayTitle,
    };
    final partnerInfo = <String, String>{
      t.first_name: partner?.name ?? t.empty,
      t.phone: partner?.phoneNumber ?? t.empty,
      t.age: nextAge.isEmpty ? t.empty : nextAge,
      t.gender: switch (partner?.gender) {
        null => t.empty,
        final gender => getTranslateGender(gender) ?? gender,
      },
      if (partner?.dateOfBirth case final dateOfBirth?)
        t.date_of_birth: dateTimeToString(dateOfBirth),
      t.email: ?partner?.email,
    };
    return Scaffold(
      appBar: appAppBar(title: t.info),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  t.info,
                  style: AppTextStyle().bigTitle,
                  textAlign: TextAlign.center,
                ),
                SvgPicture.asset(infoIllustration, height: 200),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(t.app_info, style: AppTextStyle().title),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      rowOfInfo(appInfo.entries.elementAt(index)),
                  separatorBuilder: (context, index) => kheasydevDivider(
                    black: true,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  itemCount: appInfo.length,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(t.partner_info, style: AppTextStyle().title),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      rowOfInfo(partnerInfo.entries.elementAt(index)),
                  separatorBuilder: (context, index) => kheasydevDivider(
                    black: true,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  itemCount: partnerInfo.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row rowOfInfo(MapEntry<String, String> rowInfo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(rowInfo.key),
        Text(rowInfo.value),
      ],
    );
  }
}
