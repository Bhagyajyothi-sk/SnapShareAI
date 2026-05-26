import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../core/constants.dart';
import '../models/contact_model.dart';

class ContactService {

  Future<List<ContactModel>> getContacts() async {

    try {

      final response = await http.get(
        Uri.parse(
          '${AppConstants.baseUrl}/contacts/',
        ),
      );

      if (response.statusCode == 200) {

        final data =
            jsonDecode(response.body);

        List contactsJson =
            data['contacts'];

        return contactsJson
            .map(
              (contact) =>
                  ContactModel.fromJson(
                contact,
              ),
            )
            .toList();

      } else {

        throw Exception(
          'Failed to load contacts',
        );
      }

    } catch (e) {

      throw Exception(
        e.toString(),
      );
    }
  }

  Future<String> createContact({
    required String name,
    required String email,
    required String phone,
  }) async {

    try {

      final response = await http.post(

        Uri.parse(
          '${AppConstants.baseUrl}/contacts/',
        ),

        headers: {
          'Content-Type':
              'application/json',
        },

        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
        }),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {

        final data =
            jsonDecode(response.body);

        return data['contact']['_id'];

      } else {

        throw Exception(
          'Failed to create contact',
        );
      }

    } catch (e) {

      throw Exception(
        e.toString(),
      );
    }
  }

  Future<void> uploadFace({

    required String contactId,
    required XFile imageFile,

  }) async {

    try {

      final bytes =
          await imageFile.readAsBytes();

      var request =
          http.MultipartRequest(

        'POST',

        Uri.parse(
          '${AppConstants.baseUrl}/contacts/face/$contactId',
        ),
      );

      request.files.add(

        http.MultipartFile.fromBytes(

          'file',

          bytes,

          filename: imageFile.name,
        ),
      );

      final response =
          await request.send();

      if (response.statusCode != 200) {

        throw Exception(
          'Face upload failed',
        );
      }

    } catch (e) {

      throw Exception(
        e.toString(),
      );
    }
  }

  Future<void> deleteContact(
    String id,
  ) async {

    try {

      final response =
          await http.delete(

        Uri.parse(
          '${AppConstants.baseUrl}/contacts/$id',
        ),
      );

      if (response.statusCode != 200) {

        throw Exception(
          'Failed to delete contact',
        );
      }

    } catch (e) {

      throw Exception(
        e.toString(),
      );
    }
  }

  Future<void> updateContact({

    required String id,
    required String name,
    required String email,
    required String phone,

  }) async {

    try {

      final response = await http.put(

        Uri.parse(
          '${AppConstants.baseUrl}/contacts/$id',
        ),

        headers: {
          'Content-Type':
              'application/json',
        },

        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
        }),
      );

      if (response.statusCode != 200) {

        throw Exception(
          'Failed to update contact',
        );
      }

    } catch (e) {

      throw Exception(
        e.toString(),
      );
    }
  }
}