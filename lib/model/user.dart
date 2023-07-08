import 'dart:convert';

User? userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User? data) => json.encode(data!.toJson());

class User {
  User({
    this.username = '',
    this.password = '',
  });

  String username;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["email"] ?? '',
    password: json["password"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "email": username,
    "password": password,
  };
}