import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chatapp/ModelClasses/UserModel.dart';
import 'package:chatapp/Services/Auth_api_services.dart';

class RegisterController {
  final BuildContext context;
  final ValueNotifier<bool> isLoading;

  RegisterController(this.context, this.isLoading);

  Future<void> handleregister(
      String name,
      String email,
      String username,
      String password,
      File? avatar,
      ) async {
    if ([name, email, username, password].any((field) => field.trim().isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    final user = UserModel(
      name: name,
      email: email,
      username: username,
      password: password,
      avatarFile: avatar,
    );

    isLoading.value = true; // Start loading

    try {
      final response = await ApiAuthServices.registerUser(user);
      if (!context.mounted) return;
      if (response['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'] ?? "Registration successful")),
        );
        // Navigate or do something here
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'] ?? "Registration failed")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Something went wrong: $e")),
      );
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
