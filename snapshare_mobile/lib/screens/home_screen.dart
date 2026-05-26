import 'package:flutter/material.dart';

import '../widgets/primary_button.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF8FAFC),

      body: SafeArea(

        child: Padding(

          padding:
              const EdgeInsets.all(
            24,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 10),

              Row(
                children: [

                  Container(

                    padding:
                        const EdgeInsets.all(
                      14,
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
                        18,
                      ),
                    ),

                    child: const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Text(
                    'SnapShare AI',

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Container(

                width: double.infinity,
                height: 320,

                decoration: BoxDecoration(

                  gradient:
                      const LinearGradient(
                    begin:
                        Alignment.topLeft,

                    end:
                        Alignment.bottomRight,

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
                    36,
                  ),

                  boxShadow: [

                    BoxShadow(
                      color: Colors
                          .deepPurple
                          .withOpacity(
                        0.18,
                      ),

                      blurRadius: 30,

                      offset:
                          const Offset(
                        0,
                        14,
                      ),
                    ),
                  ],
                ),

                child: Stack(
                  children: [

                    Positioned(
                      top: -40,
                      right: -30,

                      child: Container(
                        width: 140,
                        height: 140,

                        decoration:
                            BoxDecoration(
                          color: Colors
                              .white
                              .withOpacity(
                            0.08,
                          ),

                          shape:
                              BoxShape.circle,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: -30,
                      left: -20,

                      child: Container(
                        width: 120,
                        height: 120,

                        decoration:
                            BoxDecoration(
                          color: Colors
                              .white
                              .withOpacity(
                            0.08,
                          ),

                          shape:
                              BoxShape.circle,
                        ),
                      ),
                    ),

                    Padding(

                      padding:
                          const EdgeInsets.all(
                        30,
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

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

                            child: const Row(

                              mainAxisSize:
                                  MainAxisSize
                                      .min,

                              children: [

                                Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: Colors
                                      .greenAccent,
                                ),

                                SizedBox(width: 8),

                                Text(
                                  'AI Powered',

                                  style:
                                      TextStyle(
                                    color: Colors
                                        .white,

                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),

                          const Text(
                            'Smart Face\nRecognition',

                            style: TextStyle(
                              color:
                                  Colors.white,

                              fontSize: 42,

                              fontWeight:
                                  FontWeight.bold,

                              height: 1.1,
                            ),
                          ),

                          const SizedBox(
                            height: 18,
                          ),

                          const Text(
                            'Automatically detect faces and instantly share photos with matched contacts using AI.',

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
                  ],
                ),
              ),

              const SizedBox(height: 40),

              Row(
                children: [

                  Expanded(
                    child: Container(

                      padding:
                          const EdgeInsets.all(
                        18,
                      ),

                      decoration:
                          BoxDecoration(

                        color: Colors.white,

                        borderRadius:
                            BorderRadius.circular(
                          24,
                        ),

                        boxShadow: [

                          BoxShadow(
                            color: Colors
                                .black
                                .withOpacity(
                              0.04,
                            ),

                            blurRadius: 18,

                            offset:
                                const Offset(
                              0,
                              10,
                            ),
                          ),
                        ],
                      ),

                      child: const Column(
                        children: [

                          Icon(
                            Icons.face,
                            size: 34,
                            color:
                                Color(
                              0xFF6366F1,
                            ),
                          ),

                          SizedBox(height: 12),

                          Text(
                            'AI Detection',

                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Container(

                      padding:
                          const EdgeInsets.all(
                        18,
                      ),

                      decoration:
                          BoxDecoration(

                        color: Colors.white,

                        borderRadius:
                            BorderRadius.circular(
                          24,
                        ),

                        boxShadow: [

                          BoxShadow(
                            color: Colors
                                .black
                                .withOpacity(
                              0.04,
                            ),

                            blurRadius: 18,

                            offset:
                                const Offset(
                              0,
                              10,
                            ),
                          ),
                        ],
                      ),

                      child: const Column(
                        children: [

                          Icon(
                            Icons.send,
                            size: 34,
                            color:
                                Color(
                              0xFF8B5CF6,
                            ),
                          ),

                          SizedBox(height: 12),

                          Text(
                            'Auto Sharing',

                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              PrimaryButton(

                title: 'Get Started',

                onPressed: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                          const LoginScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}