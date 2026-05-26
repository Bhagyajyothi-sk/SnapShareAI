import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import '../services/contact_service.dart';

class EditContactScreen extends StatefulWidget {

  final ContactModel contact;

  const EditContactScreen({
    super.key,
    required this.contact,
  });

  @override
  State<EditContactScreen> createState() =>
      _EditContactScreenState();
}

class _EditContactScreenState
    extends State<EditContactScreen> {

  final ContactService contactService =
      ContactService();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(
      text: widget.contact.name,
    );

    emailController =
        TextEditingController(
      text: widget.contact.email,
    );

    phoneController =
        TextEditingController(
      text: widget.contact.phone,
    );
  }

  Future<void> updateContact() async {

    try {

      setState(() {
        isLoading = true;
      });

      await contactService.updateContact(
        id: widget.contact.id,

        name:
            nameController.text.trim(),

        email:
            emailController.text.trim(),

        phone:
            phoneController.text.trim(),
      );

      if (mounted) {

        Navigator.pop(context, true);

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              'Contact updated successfully',
            ),
          ),
        );
      }

    } catch (e) {

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  Widget buildField({
    required TextEditingController controller,
    required String hint,
  }) {

    return Padding(
      padding:
          const EdgeInsets.only(bottom: 20),

      child: TextField(
        controller: controller,

        decoration: InputDecoration(
          hintText: hint,

          filled: true,

          fillColor:
              Colors.grey.shade100,

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(20),

            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Edit Contact',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [

            const SizedBox(height: 20),

            buildField(
              controller: nameController,
              hint: 'Contact Name',
            ),

            buildField(
              controller: emailController,
              hint: 'Email',
            ),

            buildField(
              controller: phoneController,
              hint: 'Phone Number',
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(

                onPressed:
                    isLoading
                        ? null
                        : updateContact,

                style:
                    ElevatedButton
                        .styleFrom(
                  backgroundColor:
                      Colors.black,

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),
                ),

                child:
                    isLoading
                        ? const CircularProgressIndicator(
                            color:
                                Colors.white,
                          )
                        : const Text(
                            'Update Contact',

                            style:
                                TextStyle(
                              color:
                                  Colors.white,
                              fontSize:
                                  18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}