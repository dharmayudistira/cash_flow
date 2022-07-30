const String tableUser = 'table_users';

class UserFields {
  static const List<String> userColumns = [
    id,
    username,
    password,
    name,
  ];

  static const String id = '_id';
  static const String username = 'username';
  static const String password = 'password';
  static const String name = 'name';
}

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
