import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants.dart';
import '../models/history_model.dart';

class HistoryService {
  Future<List<HistoryModel>>
      getHistory() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${AppConstants.baseUrl}/delivery/logs',
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        List logs = data['delivery_logs'];

        return logs
            .map(
              (log) =>
                  HistoryModel.fromJson(log),
            )
            .toList();
      } else {
        throw Exception(
          'Failed to load history',
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}