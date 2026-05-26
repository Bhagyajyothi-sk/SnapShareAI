import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants.dart';

class DashboardService {

  Future<Map<String, dynamic>> getStats() async {

    try {

      final response = await http.get(
        Uri.parse(
          '${AppConstants.baseUrl}/dashboard/stats',
        ),
      );

      if (response.statusCode == 200) {

        return jsonDecode(response.body);

      } else {

        throw Exception(
          'Failed to load dashboard stats',
        );
      }

    } catch (e) {

      throw Exception(e.toString());
    }
  }
}