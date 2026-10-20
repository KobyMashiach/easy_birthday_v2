import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/gender_utils.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';

/// The birthday title and description built from the texts the owner chose
/// in onboarding (`EventModel.chosenTexts`).
enum ReadyTextEnum { title, description }

/// [textEnum] for the session's event.
String getEventsString({required ReadyTextEnum textEnum}) => buildReadyTexts(
  textEnum: textEnum,
  chosenItems: SessionService().event?.chosenTexts ?? {},
);

String buildReadyTexts({
  required ReadyTextEnum textEnum,
  required Map<String, String> chosenItems,
}) {
  final SessionService session = SessionService();
  final bool isPartner = session.user.role.isPartner();
  return switch (textEnum) {
    ReadyTextEnum.title =>
      "${isPartner ? session.user.name : session.partner?.name ?? ''} ${getTextChosenMap(chosenItems, 'title_text')} ${calculateNextAge()}",
    ReadyTextEnum.description =>
      "${getTextChosenMap(chosenItems, 'relationship')} ${t.my_dear(context: isPartner ? session.gender : getPartnerGender())}, ${t.special_age(age: calculateNextAge())}",
  };
}

String getTextChosenMap(Map<String, String> chosenItems, String keyInMap) =>
    chosenItems[keyInMap] ?? '';
