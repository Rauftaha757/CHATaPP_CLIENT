import 'dart:io';

class UserModel {
  final String ?name;
  final String email;
  final String? username;
  final String? password;
  final File? avatarFile;
  final String? avatar;

  UserModel({
     this.name,
    required this.email,
    this.username,
    this.password,
    this.avatarFile,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "username": username,
      "password": password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      username: json['username'],
      avatar: json['avatar'],
    );
  }
}
