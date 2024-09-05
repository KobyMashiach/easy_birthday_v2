import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

@HiveType(typeId: 103)
enum RoleModel {
  @HiveField(0)
  admin,
  @HiveField(1)
  owner,
  @HiveField(2)
  partner,
}

extension RoleModelExtension on RoleModel {
  String getName() {
    return toString().split('.').last;
  }

  // Convert from String to RoleModel
  static RoleModel fromString(String role) {
    switch (role.toLowerCase()) {
      case 'admin':
        return RoleModel.admin;
      case 'owner':
        return RoleModel.owner;
      case 'partner':
        return RoleModel.partner;
      default:
        throw Exception('Invalid RoleModel string: $role');
    }
  }

  bool isAdmin() {
    return this == RoleModel.admin;
  }

  bool isOwner() {
    return this == RoleModel.owner;
  }

  bool isPartner() {
    return this == RoleModel.partner;
  }
}

class RoleModelConverter implements JsonConverter<RoleModel, String> {
  const RoleModelConverter();

  @override
  RoleModel fromJson(String json) {
    return RoleModelExtension.fromString(json);
  }

  @override
  String toJson(RoleModel roleModel) {
    return roleModel.getName();
  }
}
