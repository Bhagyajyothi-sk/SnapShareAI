import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/contact_service.dart';
import '../services/image_service.dart';
import '../widgets/primary_button.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() =>
      _AddContactScreenState();
}

class _AddContactScreenState
    extends State<AddContactScreen> {

  final ContactService contactService =
      ContactService();

  final ImageService imageService =
      ImageService();

  XFile? selectedImage;

  final TextEditingController
      nameController =
          TextEditingController();

  final TextEditingController
      emailController =
          TextEditingController();

  final TextEditingController
      phoneController =
          TextEditingController();

  bool isLoading = false;

  Future<void> pickImage() async {

    final image =
        await imageService.pickImage();

    if (image != null) {

      setState(() {
        selectedImage = image;
      });
    }
  }

  Future<void> saveContact() async {

    final name =
        nameController.text.trim();

    final email =
        emailController.text.trim();

    final phone =
        phoneController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        selectedImage == null) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content: Text(
            'Please fill all fields and upload image',
          ),
        ),
      );

      return;
    }

    try {

      setState(() {
        isLoading = true;
      });

      final contactId =
          await contactService.createContact(

        name: name,
        email: email,
        phone: phone,
      );

      await contactService.uploadFace(

        contactId: contactId,
        imageFile: selectedImage!,
      );

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content: Text(
            'Contact Added Successfully',
          ),
        ),
      );

      Navigator.pop(context);

    } catch (e) {

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  Widget buildImagePreview() {

    if (selectedImage == null) {

      return const Column(

        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Icon(
            Icons.image_outlined,
            size: 50,
            color: Colors.black54,
          ),

          SizedBox(height: 10),

          Text(
            'Upload Face Photo',

            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      );
    }

    if (kIsWeb) {

      return ClipRRect(

        borderRadius:
            BorderRadius.circular(20),

        child: Image.network(

          selectedImage!.path,

          fit: BoxFit.cover,

          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return ClipRRect(

      borderRadius:
          BorderRadius.circular(20),

      child: Image.network(

        selectedImage!.path,

        fit: BoxFit.cover,

        width: double.infinity,
        height: double.infinity,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Add Contact',
        ),
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(24),

        child: Column(
          children: [

            TextField(

              controller:
                  nameController,

              decoration:
                  const InputDecoration(
                hintText:
                    'Contact Name',
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            TextField(

              controller:
                  emailController,

              decoration:
                  const InputDecoration(
                hintText:
                    'Contact Email',
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            TextField(

              controller:
                  phoneController,

              decoration:
                  const InputDecoration(
                hintText:
                    'Phone Number',
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            GestureDetector(

              onTap: pickImage,

              child: Container(

                height: 180,
                width: double.infinity,

                decoration: BoxDecoration(

                  color:
                      Colors.grey.shade100,

                  borderRadius:
                      BorderRadius.circular(
                    20,
                  ),
                ),

                child:
                    buildImagePreview(),
              ),
            ),

            const Spacer(),

            isLoading

                ? const CircularProgressIndicator()

                : PrimaryButton(

                    title:
                        'Save Contact',

                    onPressed:
                        saveContact,
                  ),
          ],
        ),
      ),
    );
  }
}