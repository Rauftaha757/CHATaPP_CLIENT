import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chatapp/ModelClasses/UserModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ApiAuthServices {
  static const String baseUrl = 'http://192.168.18.62:3000';
  // static const String baseUrl = 'http://10.0.2.2:3000'; // For Android emulator

  static Future<Map<String, dynamic>> registerUser(UserModel user) async {
    final url = Uri.parse("$baseUrl/api/registeruser");
    try {
      final request = http.MultipartRequest('POST', url);
      request.fields['name'] = user.name ?? "";
      request.fields['email'] = user.email ?? "";
      request.fields['username'] = user.username ?? "";
      request.fields['password'] = user.password ?? "";

      // Add image if present
      if (user.avatarFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath("avatar", user.avatarFile!.path),
        );
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      final jsonResponse = jsonDecode(response.body);
      final message = jsonResponse['message'];
      final success = jsonResponse['success'];

      print("Message: $message");

      if (success == true) {
        print("✅ Registration successful");
      } else {
        print("❌ Registration failed");
      }

      return {
        'success': success,
        'message': message,
      };
    } catch (err) {
      print("❌ Error: $err");
      return {
        'success': false,
        'message': 'Something went wrong',
      };
    }
  }



  // Login API function
  static Future<Map<String, dynamic>> LoginIn(UserModel user) async {
    final url = Uri.parse("${baseUrl}/api/loginuser");

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": user.email,
          "password": user.password,
        }),
      );

      final jsonResponse = jsonDecode(response.body);
      final statusCode = jsonResponse['statusCode'];
      final message = jsonResponse['message'];

      if (statusCode == 200) {
        final data = jsonResponse['data'];
        final email = data['email'];
        final username = data['username'];
        final refreshToken = data['refreshtoken'];

        return {
          'success': true,
          'message': message,
          'email': email,
          'username': username,
          'token': refreshToken,
        };
      } else {
        return {
          'success': false,
          'message': message ?? 'Login failed',
        };
      }
    } catch (err) {
      return {
        'success': false,
        'message': 'Something went wrong: $err',
      };
    }
  }



}
