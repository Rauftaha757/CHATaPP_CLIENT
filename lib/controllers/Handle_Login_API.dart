import 'package:chatapp/ModelClasses/UserModel.dart';
import 'package:chatapp/Services/Auth_api_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final BuildContext context;
  LoginController(this.context);

  Future<void> handlelogin(
      String email,
      String password, {
        required VoidCallback onComplete,
      }) async {
    if ([email, password].any((field) => field.trim().isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      onComplete();
      return;
    }

    final user = UserModel(email: email, password: password);

    try {
      final response = await ApiAuthServices.LoginIn(user);

      if (!context.mounted) {
        onComplete();
        return;
      }

      if (response['statusCode'] == 200) {
        final data = response['data'];
        final refreshToken = data['refreshtoken'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', refreshToken);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'] ?? 'Login successful')),
        );

        // Navigation logic (optional)
        // Navigator.pushReplacement(...);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'] ?? 'Login failed')),
        );
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Something went wrong: $err")),
      );
    } finally {
      onComplete(); // Always called at the end
    }
  }
}
