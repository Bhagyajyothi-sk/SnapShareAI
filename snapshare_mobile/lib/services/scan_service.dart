import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../core/constants.dart';
import '../models/matched_contact_model.dart';

class ScanService {
  Future<List<MatchedContactModel>>
      scanGroupPhoto(
    XFile image,
  ) async {
    try {
      final bytes = await image.readAsBytes();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${AppConstants.baseUrl}/scan/',
        ),
      );

      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          bytes,
          filename: image.name,
        ),
      );

      final streamedResponse =
          await request.send();

      final response = await http.Response.fromStream(
        streamedResponse,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        List matchedContacts =
            data['matched_contacts'];

        return matchedContacts
            .map(
              (contact) =>
                  MatchedContactModel.fromJson(
                contact,
              ),
            )
            .toList();
      } else {
        throw Exception('AI scan failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}