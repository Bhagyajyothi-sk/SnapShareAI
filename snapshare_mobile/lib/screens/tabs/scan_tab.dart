import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/matched_contact_model.dart';
import '../../services/scan_service.dart';
import '../../widgets/primary_button.dart';

class ScanTab extends StatefulWidget {
  const ScanTab({super.key});

  @override
  State<ScanTab> createState() => _ScanTabState();
}

class _ScanTabState extends State<ScanTab> {

  final ScanService scanService =
      ScanService();

  final ImagePicker picker =
      ImagePicker();

  XFile? selectedImage;

  bool isLoading = false;

  List<MatchedContactModel>
      matchedContacts = [];

  Future<void> pickImage() async {

    final image =
        await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {

      setState(() {
        selectedImage = image;
      });
    }
  }

  Future<void> scanPhoto() async {

    try {

      if (selectedImage == null) {

        throw Exception(
          'Please select a group photo',
        );
      }

      setState(() {
        isLoading = true;
      });

      final results =
          await scanService
              .scanGroupPhoto(
        selectedImage!,
      );

      setState(() {

        matchedContacts = results;

        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(

          backgroundColor:
              const Color(0xFF111827),

          behavior:
              SnackBarBehavior.floating,

          margin:
              const EdgeInsets.all(20),

          content: const Text(
            'AI scan completed successfully',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

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

  Widget buildImagePreview() {

    if (selectedImage == null) {

      return Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Container(

            padding:
                const EdgeInsets.all(
              24,
            ),

            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.add_photo_alternate,
              size: 44,
              color: Color(0xFF6366F1),
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'Upload Group Photo',

            style: TextStyle(
              fontSize: 22,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'AI will detect faces and automatically share photos.',

            textAlign:
                TextAlign.center,

            style: TextStyle(
              color:
                  Colors.grey.shade600,

              height: 1.5,
            ),
          ),
        ],
      );
    }

    if (kIsWeb) {

      return ClipRRect(

        borderRadius:
            BorderRadius.circular(
          32,
        ),

        child: Image.network(
          selectedImage!.path,

          fit: BoxFit.cover,
        ),
      );
    }

    return ClipRRect(

      borderRadius:
          BorderRadius.circular(
        32,
      ),

      child: Image.file(
        File(selectedImage!.path),

        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildMatchedCard(
    MatchedContactModel contact,
  ) {

    return Container(

      margin:
          const EdgeInsets.only(
        bottom: 18,
      ),

      padding:
          const EdgeInsets.all(
        18,
      ),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(
          26,
        ),

        boxShadow: [

          BoxShadow(
            color:
                Colors.black.withOpacity(
              0.04,
            ),

            blurRadius: 18,

            offset:
                const Offset(0, 10),
          ),
        ],
      ),

      child: Row(
        children: [

          CircleAvatar(

            radius: 28,

            backgroundColor:
                const Color(
              0xFF6366F1,
            ),

            child: Text(

              contact.name[0]
                  .toUpperCase(),

              style:
                  const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [

                Text(
                  contact.name,

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  contact.email,

                  style: TextStyle(
                    color:
                        Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          Container(

            padding:
                const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),

            decoration: BoxDecoration(

              color:
                  Colors.green.shade100,

              borderRadius:
                  BorderRadius.circular(
                30,
              ),
            ),

            child: Text(
              'Delivered',

              style: TextStyle(
                color:
                    Colors.green.shade700,

                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF8FAFC),

      body: SafeArea(

        child: SingleChildScrollView(

          padding:
              const EdgeInsets.all(
            24,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,

            children: [

              Container(

                width:
                    double.infinity,

                padding:
                    const EdgeInsets.all(
                  28,
                ),

                decoration: BoxDecoration(

                  gradient:
                      const LinearGradient(
                    colors: [

                      Color(
                        0xFF6366F1,
                      ),

                      Color(
                        0xFF8B5CF6,
                      ),
                    ],
                  ),

                  borderRadius:
                      BorderRadius.circular(
                    34,
                  ),
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

                    Row(
                      children: [

                        Container(

                          padding:
                              const EdgeInsets.all(
                            14,
                          ),

                          decoration:
                              BoxDecoration(
                            color: Colors
                                .white
                                .withOpacity(
                              0.16,
                            ),

                            borderRadius:
                                BorderRadius.circular(
                              18,
                            ),
                          ),

                          child: const Icon(
                            Icons
                                .auto_awesome,

                            color:
                                Colors.white,
                          ),
                        ),

                        const Spacer(),

                        Container(

                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),

                          decoration:
                              BoxDecoration(
                            color: Colors
                                .white
                                .withOpacity(
                              0.16,
                            ),

                            borderRadius:
                                BorderRadius.circular(
                              30,
                            ),
                          ),

                          child: const Text(
                            'AI Scanner',

                            style: TextStyle(
                              color:
                                  Colors.white,

                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    const Text(
                      'AI Face Scan',

                      style: TextStyle(
                        color:
                            Colors.white,

                        fontSize: 36,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    const Text(
                      'Detect faces from group photos and automatically deliver photos using AI.',

                      style: TextStyle(
                        color:
                            Colors.white70,

                        fontSize: 16,

                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              GestureDetector(

                onTap: pickImage,

                child: Container(

                  height: 320,
                  width: double.infinity,

                  padding:
                      const EdgeInsets.all(
                    20,
                  ),

                  decoration: BoxDecoration(

                    color: const Color(
                      0xFFEDE9FE,
                    ),

                    borderRadius:
                        BorderRadius.circular(
                      34,
                    ),
                  ),

                  child: buildImagePreview(),
                ),
              ),

              const SizedBox(height: 28),

              if (isLoading)

                Container(

                  width:
                      double.infinity,

                  padding:
                      const EdgeInsets.all(
                    28,
                  ),

                  decoration: BoxDecoration(

                    color:
                        const Color(
                      0xFF111827,
                    ),

                    borderRadius:
                        BorderRadius.circular(
                      30,
                    ),
                  ),

                  child: const Column(
                    children: [

                      CircularProgressIndicator(
                        color: Colors.white,
                      ),

                      SizedBox(height: 22),

                      Text(
                        'AI is scanning faces and delivering photos...',

                        textAlign:
                            TextAlign.center,

                        style: TextStyle(
                          color:
                              Colors.white,

                          fontSize: 18,

                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )

              else

                PrimaryButton(
                  title:
                      'Start AI Scan',
                  onPressed:
                      scanPhoto,
                ),

              const SizedBox(height: 34),

              if (matchedContacts
                  .isNotEmpty) ...[

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                  children: [

                    const Text(
                      'Matched Contacts',

                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    Container(

                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),

                      decoration:
                          BoxDecoration(

                        color: const Color(
                          0xFFEDE9FE,
                        ),

                        borderRadius:
                            BorderRadius.circular(
                          30,
                        ),
                      ),

                      child: Text(
                        '${matchedContacts.length} Shared',

                        style: const TextStyle(
                          color:
                              Color(
                            0xFF6366F1,
                          ),

                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                ...matchedContacts.map(
                  (contact) =>
                      buildMatchedCard(
                    contact,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}