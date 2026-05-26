import 'package:flutter/material.dart';

import 'tabs/home_tab.dart';
import 'tabs/contacts_tab.dart';
import 'tabs/scan_tab.dart';
import 'tabs/history_tab.dart';
import 'tabs/profile_tab.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState
    extends State<DashboardScreen> {

  int currentIndex = 0;

  final List<Widget> screens = [

    const HomeTab(),

    const ContactsTab(),

    const ScanTab(),

    const HistoryTab(),

    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      extendBody: true,

      body: AnimatedSwitcher(

        duration:
            const Duration(
          milliseconds: 250,
        ),

        child: screens[currentIndex],
      ),

      bottomNavigationBar: Padding(

        padding:
            const EdgeInsets.only(
          left: 18,
          right: 18,
          bottom: 18,
        ),

        child: Container(

          height: 82,

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius:
                BorderRadius.circular(
              30,
            ),

            boxShadow: [

              BoxShadow(
                color:
                    Colors.black.withOpacity(
                  0.08,
                ),

                blurRadius: 24,

                offset:
                    const Offset(
                  0,
                  12,
                ),
              ),
            ],
          ),

          child: Row(

            mainAxisAlignment:
                MainAxisAlignment
                    .spaceAround,

            children: [

              buildNavItem(
                index: 0,
                icon:
                    Icons.home_rounded,
                label: 'Home',
              ),

              buildNavItem(
                index: 1,
                icon:
                    Icons.people_rounded,
                label: 'Contacts',
              ),

              buildNavItem(
                index: 2,
                icon:
                    Icons.camera_alt_rounded,
                label: 'Scan',
              ),

              buildNavItem(
                index: 3,
                icon:
                    Icons.history_rounded,
                label: 'History',
              ),

              buildNavItem(
                index: 4,
                icon:
                    Icons.person_rounded,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem({

    required int index,

    required IconData icon,

    required String label,
  }) {

    final bool isSelected =
        currentIndex == index;

    return GestureDetector(

      onTap: () {

        setState(() {

          currentIndex = index;
        });
      },

      child: AnimatedContainer(

        duration:
            const Duration(
          milliseconds: 220,
        ),

        padding:
            const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),

        decoration: BoxDecoration(

          gradient: isSelected

              ? const LinearGradient(
                  colors: [

                    Color(
                      0xFF6366F1,
                    ),

                    Color(
                      0xFF8B5CF6,
                    ),
                  ],
                )

              : null,

          borderRadius:
              BorderRadius.circular(
            18,
          ),
        ),

        child: Column(

          mainAxisSize:
              MainAxisSize.min,

          children: [

            Icon(

              icon,

              color: isSelected

                  ? Colors.white

                  : Colors.grey
                      .shade500,
            ),

            const SizedBox(height: 4),

            Text(

              label,

              style: TextStyle(

                color: isSelected

                    ? Colors.white

                    : Colors.grey
                        .shade600,

                fontSize: 12,

                fontWeight: isSelected

                    ? FontWeight.bold

                    : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}