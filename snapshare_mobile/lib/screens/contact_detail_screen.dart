import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import '../services/contact_service.dart';
import 'edit_contact_screen.dart';

class ContactDetailScreen extends StatefulWidget {

  final ContactModel contact;

  const ContactDetailScreen({
    super.key,
    required this.contact,
  });

  @override
  State<ContactDetailScreen> createState() =>
      _ContactDetailScreenState();
}

class _ContactDetailScreenState
    extends State<ContactDetailScreen> {

  final ContactService contactService =
      ContactService();

  bool isDeleting = false;

  Future<void> deleteContact() async {

    try {

      setState(() {
        isDeleting = true;
      });

      await contactService.deleteContact(
        widget.contact.id,
      );

      if (mounted) {

        Navigator.pop(context, true);

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              'Contact deleted successfully',
            ),
          ),
        );
      }

    } catch (e) {

      setState(() {
        isDeleting = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  Widget buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
  }) {

    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius:
            BorderRadius.circular(24),
      ),

      child: Row(
        children: [

          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.black,

            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final contact = widget.contact;

    return Scaffold(

      appBar: AppBar(

  title: const Text(
    'Contact Details',
  ),

  actions: [

    IconButton(

      onPressed: () async {

        final result =
            await Navigator.push(

          context,

          MaterialPageRoute(
            builder: (_) =>
                EditContactScreen(
              contact: contact,
            ),
          ),
        );

        if (result == true) {
          Navigator.pop(context, true);
        }
      },

      icon: const Icon(
        Icons.edit,
      ),
    ),
  ],
),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [

            const SizedBox(height: 20),

            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,

              child: Text(
                contact.name[0]
                    .toUpperCase(),

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              contact.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            buildInfoCard(
              title: 'Email',
              value: contact.email,
              icon:
                  Icons.email_outlined,
            ),

            buildInfoCard(
              title: 'Phone',
              value: contact.phone,
              icon:
                  Icons.phone_outlined,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                onPressed:
                    isDeleting
                        ? null
                        : deleteContact,

                style:
                    ElevatedButton
                        .styleFrom(
                  backgroundColor:
                      Colors.red,

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),
                ),

                child:
                    isDeleting
                        ? const CircularProgressIndicator(
                            color:
                                Colors.white,
                          )
                        : const Text(
                            'Delete Contact',

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