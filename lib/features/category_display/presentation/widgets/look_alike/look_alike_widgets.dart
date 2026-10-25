import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/app_network_image.dart';
import 'package:easy_birthday/features/event/data/models/look_alike_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:flutter/material.dart';

/// The owner's and the partner's names, whoever is signed in.
({String owner, String partner}) lookAlikeParentNames() {
  final SessionService session = SessionService();
  final String me = session.user.name;
  final String other = session.partner?.name ?? '';
  return session.user.role.isPartner()
      ? (owner: other, partner: me)
      : (owner: me, partner: other);
}

/// The name of the parent [answer] picks.
String lookAlikeParentName(String answer) {
  final names = lookAlikeParentNames();
  return answer == LookAlikeModel.owner ? names.owner : names.partner;
}

extension LookAlikeFeatureTexts on LookAlikeFeature {
  String get label => switch (this) {
    LookAlikeFeature.eyes => t.feature_eyes,
    LookAlikeFeature.nose => t.feature_nose,
    LookAlikeFeature.mouth => t.feature_mouth,
    LookAlikeFeature.ears => t.feature_ears,
    LookAlikeFeature.hair => t.feature_hair,
    LookAlikeFeature.smile => t.feature_smile,
    LookAlikeFeature.hands => t.feature_hands,
    LookAlikeFeature.laugh => t.feature_laugh,
    LookAlikeFeature.temper => t.feature_temper,
  };
}

/// A round photo, or the name's first letter when there is none.
class RoundPhoto extends StatelessWidget {
  final String? url;
  final String name;
  final double size;
  final Color? border;

  const RoundPhoto({
    super.key,
    required this.url,
    required this.name,
    required this.size,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final String? url = this.url;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: border ?? Colors.white, width: 4),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6)],
      ),
      child: ClipOval(
        child: url != null
            ? AppNetworkImage(url: url, memCacheWidth: (size * 3).round())
            : ColoredBox(
                color: Color.lerp(AppColors.primaryColor, Colors.white, 0.4)!,
                child: Center(
                  child: Text(
                    name.isEmpty ? "?" : name.characters.first,
                    style: TextStyle(
                      fontSize: size * 0.45,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
