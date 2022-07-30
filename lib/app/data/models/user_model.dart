

import 'package:cash_flow/app/data/constants/db_field_constants.dart';

class UserModel {
  final int? id;
  final String username;
  final String password;
  final String name;

  const UserModel({
    this.id,
    required this.username,
    required this.password,
    required this.name,
  });

  UserModel copy({
    int? id,
    String? username,
    String? password,
    String? name,
  }) =>
      UserModel(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.name: name,
        UserFields.username: username,
        UserFields.password: password,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json[UserFields.id] as int?,
        username: json[UserFields.username] as String,
        password: json[UserFields.password] as String,
        name: json[UserFields.name] as String,
      );
}
