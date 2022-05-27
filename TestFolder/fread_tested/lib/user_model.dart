// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.avatar,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.birtday,
    required this.skill,
    required this.createdAt,
    required this.updateAt,
    required this.deletedAt,
  });

  int id;
  int avatar;
  String name;
  String surname;
  String email;
  String password;
  int birtday;
  int skill;
  int createdAt;
  dynamic updateAt;
  dynamic deletedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        avatar: json["avatar"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        password: json["password"],
        birtday: json["birtday"],
        skill: json["skill"],
        createdAt: json["created_at"],
        updateAt: json["update_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "name": name,
        "surname": surname,
        "email": email,
        "password": password,
        "birtday": birtday,
        "skill": skill,
        "created_at": createdAt,
        "update_at": updateAt,
        "deleted_at": deletedAt,
      };
}
