import 'package:json_annotation/json_annotation.dart';

enum RoleModel { admin, owner, partner }

extension RoleModelExtension on RoleModel {
  String getName() => name;

  /// Case-insensitive; throws on an unknown role.
  static RoleModel fromString(String role) {
    final lower = role.toLowerCase();
    return RoleModel.values.firstWhere(
      (value) => value.name == lower,
      orElse: () => throw FormatException('Invalid RoleModel string: $role'),
    );
  }

  bool isAdmin() => this == RoleModel.admin;
  bool isOwner() => this == RoleModel.owner;
  bool isPartner() => this == RoleModel.partner;
  bool isNotPartner() => this != RoleModel.partner;
}

class RoleModelConverter implements JsonConverter<RoleModel, String> {
  const RoleModelConverter();

  @override
  RoleModel fromJson(String json) => RoleModelExtension.fromString(json);

  @override
  String toJson(RoleModel roleModel) => roleModel.getName();
}
