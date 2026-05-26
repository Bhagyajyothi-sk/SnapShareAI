import 'package:flutter/material.dart';

import '../../services/dashboard_service.dart';

import '../add_contact_screen.dart';
import 'history_tab.dart';
import 'scan_tab.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() =>
      _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final DashboardService dashboardService =
      DashboardService();

  int totalContacts = 0;
  int totalScans = 0;
  int totalMatches = 0;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    loadDashboardStats();
  }

  Future<void> loadDashboardStats() async {

    try {

      final stats =
          await dashboardService
              .getStats();

      setState(() {

        totalContacts =
            stats['total_contacts'];

        totalScans =
            stats['total_scans'];

        totalMatches =
            stats['total_matches'];

        isLoading = false;
      });

    } catch (e) {

      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildAnalyticsCard({

    required IconData icon,

    required String title,

    required int value,
  }) {

    return Expanded(

      child: Container(

        padding:
            const EdgeInsets.all(22),

        margin:
            const EdgeInsets.all(8),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
              BorderRadius.circular(
            28,
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

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Container(

              padding:
                  const EdgeInsets.all(
                14,
              ),

              decoration: BoxDecoration(

                color:
                    const Color(
                  0xFFF3F4F6,
                ),

                borderRadius:
                    BorderRadius.circular(
                  18,
                ),
              ),

              child: Icon(
                icon,
                color:
                    const Color(
                  0xFF111827,
                ),
              ),
            ),

            const SizedBox(height: 32),

            Text(
              value.toString(),

              style: const TextStyle(
                fontSize: 34,
                fontWeight:
                    FontWeight.bold,

                color:
                    Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              title,

              style: TextStyle(
                color:
                    Colors.grey.shade600,

                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuickAction({

    required IconData icon,

    required String title,

    required String subtitle,

    required VoidCallback onTap,
  }) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        margin:
            const EdgeInsets.only(
          bottom: 18,
        ),

        padding:
            const EdgeInsets.all(22),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
              BorderRadius.circular(
            28,
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

            Container(

              padding:
                  const EdgeInsets.all(
                16,
              ),

              decoration: BoxDecoration(

                color:
                    const Color(
                  0xFFF3F4F6,
                ),

                borderRadius:
                    BorderRadius.circular(
                  18,
                ),
              ),

              child: Icon(
                icon,
                color:
                    const Color(
                  0xFF111827,
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
                    title,

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    subtitle,

                    style: TextStyle(
                      color:
                          Colors.grey.shade600,

                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color:
                  Colors.grey.shade500,
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

      body: isLoading

          ? const Center(
              child:
                  CircularProgressIndicator(),
            )

          : SafeArea(

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
                        30,
                      ),

                      decoration:
                          BoxDecoration(

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

                        boxShadow: [

                          BoxShadow(
                            color: Colors
                                .deepPurple
                                .withOpacity(
                              0.18,
                            ),

                            blurRadius: 28,

                            offset:
                                const Offset(
                              0,
                              14,
                            ),
                          ),
                        ],
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
                                    0.18,
                                  ),

                                  borderRadius:
                                      BorderRadius.circular(
                                    18,
                                  ),
                                ),

                                child:
                                    const Icon(
                                  Icons
                                      .auto_awesome,

                                  color:
                                      Colors
                                          .white,

                                  size: 30,
                                ),
                              ),

                              const Spacer(),

                              Container(

                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal:
                                      14,

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

                                child:
                                    const Row(
                                  children: [

                                    Icon(
                                      Icons
                                          .circle,

                                      size: 10,

                                      color: Colors
                                          .greenAccent,
                                    ),

                                    SizedBox(
                                        width:
                                            8),

                                    Text(
                                      'AI Active',

                                      style:
                                          TextStyle(
                                        color:
                                            Colors.white,

                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 34,
                          ),

                          const Text(
                            'SnapShare AI',

                            style: TextStyle(
                              color:
                                  Colors.white,

                              fontSize: 38,

                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          const SizedBox(
                            height: 12,
                          ),

                          const Text(
                            'Intelligent face recognition and automatic photo delivery powered by AI.',

                            style: TextStyle(
                              color:
                                  Colors.white70,

                              fontSize: 17,

                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 34),

                    const Text(
                      'Analytics',

                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [

                        buildAnalyticsCard(
                          icon: Icons.people,
                          title: 'Contacts',
                          value: totalContacts,
                        ),

                        buildAnalyticsCard(
                          icon:
                              Icons.camera_alt,
                          title: 'Scans',
                          value: totalScans,
                        ),
                      ],
                    ),

                    Row(
                      children: [

                        buildAnalyticsCard(
                          icon: Icons.face,
                          title: 'Matches',
                          value: totalMatches,
                        ),

                        buildAnalyticsCard(
                          icon: Icons.send,
                          title: 'Shared',
                          value: totalMatches,
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    const Text(
                      'Quick Actions',

                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 18),

                    buildQuickAction(

                      icon:
                          Icons.camera_alt,

                      title:
                          'Scan Group Photo',

                      subtitle:
                          'Detect faces and share automatically',

                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const ScanTab(),
                          ),
                        );
                      },
                    ),

                    buildQuickAction(

                      icon:
                          Icons.person_add,

                      title:
                          'Add New Contact',

                      subtitle:
                          'Register AI face profiles',

                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const AddContactScreen(),
                          ),
                        );
                      },
                    ),

                    buildQuickAction(

                      icon:
                          Icons.history,

                      title:
                          'Delivery History',

                      subtitle:
                          'Track AI photo deliveries',

                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const HistoryTab(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
    );
  }
}