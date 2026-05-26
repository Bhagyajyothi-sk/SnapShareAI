import 'package:flutter/material.dart';

import '../../models/contact_model.dart';
import '../../services/contact_service.dart';

import '../add_contact_screen.dart';
import '../contact_detail_screen.dart';

class ContactsTab extends StatefulWidget {
  const ContactsTab({super.key});

  @override
  State<ContactsTab> createState() =>
      _ContactsTabState();
}

class _ContactsTabState
    extends State<ContactsTab> {

  final ContactService contactService =
      ContactService();

  List<ContactModel> contacts = [];

  List<ContactModel>
      filteredContacts = [];

  bool isLoading = true;

  final TextEditingController
      searchController =
          TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  Future<void> fetchContacts() async {

    try {

      final fetchedContacts =
          await contactService
              .getContacts();

      setState(() {

        contacts = fetchedContacts;

        filteredContacts =
            fetchedContacts;

        isLoading = false;
      });

    } catch (e) {

      setState(() {
        isLoading = false;
      });
    }
  }

  void searchContacts(String query) {

    final results = contacts.where(
      (contact) {

        final name =
            contact.name
                .toLowerCase();

        final email =
            contact.email
                .toLowerCase();

        final input =
            query.toLowerCase();

        return name.contains(input) ||
            email.contains(input);
      },
    ).toList();

    setState(() {
      filteredContacts = results;
    });
  }

  Widget buildSearchBar() {

    return Container(

      margin:
          const EdgeInsets.only(
        top: 24,
        bottom: 26,
      ),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(
          22,
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

      child: TextField(

        controller: searchController,

        onChanged: searchContacts,

        decoration: InputDecoration(

          hintText:
              'Search AI contacts',

          hintStyle: TextStyle(
            color:
                Colors.grey.shade500,
          ),

          prefixIcon: const Icon(
            Icons.search,
          ),

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(
              22,
            ),

            borderSide:
                BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget buildContactCard(
    ContactModel contact,
  ) {

    return GestureDetector(

      onTap: () async {

        final result =
            await Navigator.push(

          context,

          MaterialPageRoute(
            builder: (_) =>
                ContactDetailScreen(
              contact: contact,
            ),
          ),
        );

        if (result == true) {
          fetchContacts();
        }
      },

      child: Container(

        margin:
            const EdgeInsets.only(
          bottom: 18,
        ),

        padding:
            const EdgeInsets.all(
          20,
        ),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
              BorderRadius.circular(
            28,
          ),

          boxShadow: [

            BoxShadow(
              color: Colors.black
                  .withOpacity(0.04),

              blurRadius: 18,

              offset:
                  const Offset(0, 10),
            ),
          ],
        ),

        child: Row(
          children: [

            Container(

              width: 64,
              height: 64,

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
                  22,
                ),
              ),

              child: Center(
                child: Text(

                  contact.name
                          .isNotEmpty

                      ? contact.name[0]
                          .toUpperCase()

                      : '?',

                  style:
                      const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  Text(
                    contact.name,

                    style:
                        const TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    contact.email,

                    style: TextStyle(
                      color:
                          Colors.grey
                              .shade600,

                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(

                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),

                    decoration:
                        BoxDecoration(

                      color:
                          const Color(
                        0xFFEDE9FE,
                      ),

                      borderRadius:
                          BorderRadius.circular(
                        30,
                      ),
                    ),

                    child: const Text(

                      'AI Registered',

                      style: TextStyle(
                        color:
                            Color(
                          0xFF6366F1,
                        ),

                        fontWeight:
                            FontWeight.bold,

                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              color:
                  Colors.grey.shade400,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF8FAFC),

      floatingActionButton:
          Container(

        decoration: BoxDecoration(

          gradient:
              const LinearGradient(
            colors: [

              Color(0xFF6366F1),

              Color(0xFF8B5CF6),
            ],
          ),

          borderRadius:
              BorderRadius.circular(
            22,
          ),

          boxShadow: [

            BoxShadow(
              color: Colors
                  .deepPurple
                  .withOpacity(0.28),

              blurRadius: 18,

              offset:
                  const Offset(0, 10),
            ),
          ],
        ),

        child: FloatingActionButton(

          elevation: 0,

          backgroundColor:
              Colors.transparent,

          onPressed: () async {

            await Navigator.push(

              context,

              MaterialPageRoute(
                builder: (_) =>
                    const AddContactScreen(),
              ),
            );

            fetchContacts();
          },

          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),

      body: SafeArea(

        child: Padding(

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
                            Icons.people,
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

                          child: Text(

                            '${contacts.length} Contacts',

                            style:
                                const TextStyle(
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
                      'AI Contacts',

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
                      'Manage registered face profiles for automatic AI photo delivery.',

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

              buildSearchBar(),

              Expanded(

                child: isLoading

                    ? const Center(
                        child:
                            CircularProgressIndicator(),
                      )

                    : filteredContacts
                            .isEmpty

                        ? Center(

                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,

                              children: [

                                Icon(
                                  Icons.people_outline,
                                  size: 80,
                                  color: Colors
                                      .grey
                                      .shade400,
                                ),

                                const SizedBox(
                                  height: 20,
                                ),

                                Text(
                                  'No Contacts Found',

                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight:
                                        FontWeight.bold,

                                    color: Colors
                                        .grey
                                        .shade700,
                                  ),
                                ),
                              ],
                            ),
                          )

                        : ListView.builder(

                            itemCount:
                                filteredContacts
                                    .length,

                            itemBuilder:
                                (context,
                                    index) {

                              return buildContactCard(

                                filteredContacts[
                                    index],
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}