import 'package:flutter/material.dart';

import '../../services/session_service.dart';

import '../login_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() =>
      _ProfileTabState();
}

class _ProfileTabState
    extends State<ProfileTab> {

  Widget buildSettingTile({

    required IconData icon,

    required String title,

    required String subtitle,

    Widget? trailing,
  }) {

    return Container(

      margin:
          const EdgeInsets.only(
        bottom: 16,
      ),

      padding:
          const EdgeInsets.all(
        20,
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
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  subtitle,

                  style: TextStyle(
                    color:
                        Colors.grey.shade600,

                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          if (trailing != null)
            trailing,
        ],
      ),
    );
  }

  void logout(BuildContext context) {

    SessionService.logout();

    Navigator.pushAndRemoveUntil(

      context,

      MaterialPageRoute(
        builder: (_) =>
            const LoginScreen(),
      ),

      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {

    final name =
        SessionService.userName ??
            'SnapShare User';

    final email =
        SessionService.userEmail ??
            'user@snapshare.ai';

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
                  30,
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
                  children: [

                    CircleAvatar(

                      radius: 46,

                      backgroundColor:
                          Colors.white,

                      child: Text(

                        name[0]
                            .toUpperCase(),

                        style:
                            const TextStyle(
                          fontSize: 34,

                          fontWeight:
                              FontWeight.bold,

                          color:
                              Color(
                            0xFF6366F1,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    Text(
                      name,

                      style:
                          const TextStyle(
                        color:
                            Colors.white,

                        fontSize: 28,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    Text(
                      email,

                      style:
                          const TextStyle(
                        color:
                            Colors.white70,

                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    Container(

                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
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

                      child: const Row(

                        mainAxisSize:
                            MainAxisSize.min,

                        children: [

                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors
                                .greenAccent,
                          ),

                          SizedBox(width: 8),

                          Text(
                            'AI System Active',

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
              ),

              const SizedBox(height: 34),

              const Text(
                'AI Preferences',

                style: TextStyle(
                  fontSize: 28,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              buildSettingTile(

                icon:
                    Icons.auto_awesome,

                title:
                    'Auto Share Photos',

                subtitle:
                    'Automatically deliver matched photos',

                trailing: Switch(

                  value:
                      SessionService
                          .autoShareEnabled,

                  onChanged: (value) {

                    setState(() {

                      SessionService
                          .toggleAutoShare(
                        value,
                      );
                    });
                  },
                ),
              ),

              buildSettingTile(

                icon:
                    Icons.photo_library,

                title:
                    'Smart Gallery Scan',

                subtitle:
                    'Future automatic gallery monitoring system',

                trailing: Switch(

                  value:
                      SessionService
                          .smartScanEnabled,

                  onChanged: (value) {

                    setState(() {

                      SessionService
                          .toggleSmartScan(
                        value,
                      );
                    });
                  },
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'About Application',

                style: TextStyle(
                  fontSize: 28,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              buildSettingTile(
                icon: Icons.people,
                title: 'AI Contacts',
                subtitle:
                    'Manage registered face profiles',
              ),

              buildSettingTile(
                icon: Icons.security,
                title:
                    'Privacy & Security',
                subtitle:
                    'Protected facial recognition architecture',
              ),

              buildSettingTile(
                icon:
                    Icons.info_outline,

                title:
                    'Version',

                subtitle:
                    'SnapShare AI v1.0',
              ),

              const SizedBox(height: 26),

              SizedBox(

                width:
                    double.infinity,

                height: 62,

                child: ElevatedButton(

                  onPressed: () {
                    logout(context);
                  },

                  style:
                      ElevatedButton
                          .styleFrom(

                    elevation: 0,

                    backgroundColor:
                        const Color(
                      0xFF111827,
                    ),

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        24,
                      ),
                    ),
                  ),

                  child: const Text(

                    'Logout',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}