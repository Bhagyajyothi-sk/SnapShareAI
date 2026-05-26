import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants.dart';

import 'session_service.dart';

class AuthService {

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {

    try {

      final response = await http.post(

        Uri.parse(
          '${AppConstants.baseUrl}/auth/register',
        ),

        headers: {
          'Content-Type': 'application/json',
        },

        body: jsonEncode({

          'name': name,
          'email': email,
          'password': password,

        }),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {

        return true;

      } else {

        return false;
      }

    } catch (e) {

      throw Exception(e.toString());
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {

    try {

      final response = await http.post(

        Uri.parse(
          '${AppConstants.baseUrl}/auth/login',
        ),

        headers: {
          'Content-Type': 'application/json',
        },

        body: jsonEncode({

          'email': email,
          'password': password,

        }),
      );

      if (response.statusCode == 200) {

        final data = jsonDecode(
          response.body,
        );

        if (data['message'] ==
    'Login successful') {

  SessionService.saveUser(

    name: data['user']['name'],
    email: data['user']['email'],
  );

  return true;
} else {

          return false;
        }

      } else {

        return false;
      }

    } catch (e) {

      throw Exception(e.toString());
    }
  }
}