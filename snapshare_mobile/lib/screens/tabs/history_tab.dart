import 'package:flutter/material.dart';

import '../../models/history_model.dart';
import '../../services/history_service.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() =>
      _HistoryTabState();
}

class _HistoryTabState
    extends State<HistoryTab> {

  final HistoryService historyService =
      HistoryService();

  bool isLoading = true;

  List<HistoryModel> history = [];

  @override
  void initState() {
    super.initState();

    loadHistory();
  }

  Future<void> loadHistory() async {

    try {

      final results =
          await historyService
              .getHistory();

      setState(() {

        history = results;

        isLoading = false;
      });

    } catch (e) {

      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildHistoryCard(
    HistoryModel item,
  ) {

    return Container(

      margin:
          const EdgeInsets.only(
        bottom: 22,
      ),

      padding:
          const EdgeInsets.all(
        22,
      ),

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
              0.04,
            ),

            blurRadius: 20,

            offset:
                const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              Container(

                padding:
                    const EdgeInsets.all(
                  16,
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
                    20,
                  ),
                ),

                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
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
                      item.filename,

                      maxLines: 1,

                      overflow:
                          TextOverflow
                              .ellipsis,

                      style:
                          const TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    Text(
                      '${item.totalFacesDetected} faces detected',

                      style: TextStyle(
                        color:
                            Colors.grey
                                .shade600,

                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              Container(

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
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
                  '${item.matchedPeople.length} Shared',

                  style: TextStyle(
                    color:
                        Colors.green
                            .shade700,

                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 26),

          const Text(
            'Matched Contacts',

            style: TextStyle(
              fontSize: 18,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          Wrap(

            spacing: 10,
            runSpacing: 10,

            children:
                item.matchedPeople.map(
              (person) {

                return Container(

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
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

                  child: Row(

                    mainAxisSize:
                        MainAxisSize.min,

                    children: [

                      const Icon(
                        Icons.check_circle,
                        size: 18,
                        color:
                            Color(
                          0xFF6366F1,
                        ),
                      ),

                      const SizedBox(
                        width: 8,
                      ),

                      Text(
                        person,

                        style:
                            const TextStyle(
                          color:
                              Color(
                            0xFF6366F1,
                          ),

                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),

          const SizedBox(height: 24),

          Container(

            padding:
                const EdgeInsets.all(
              16,
            ),

            decoration: BoxDecoration(

              color:
                  const Color(
                0xFF111827,
              ),

              borderRadius:
                  BorderRadius.circular(
                22,
              ),
            ),

            child: const Row(
              children: [

                Icon(
                  Icons.email,
                  color: Colors.white,
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Text(
                    'AI delivery completed successfully',

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
                            Icons.history,
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

                            '${history.length} Logs',

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
                      'Delivery History',

                      style: TextStyle(
                        color:
                            Colors.white,

                        fontSize: 34,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    const Text(
                      'Track AI scanned photos and automatic deliveries.',

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

              Expanded(

                child: isLoading

                    ? const Center(
                        child:
                            CircularProgressIndicator(),
                      )

                    : history.isEmpty

                        ? Center(

                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,

                              children: [

                                Icon(
                                  Icons.history,
                                  size: 90,
                                  color: Colors
                                      .grey
                                      .shade400,
                                ),

                                const SizedBox(
                                  height: 22,
                                ),

                                Text(
                                  'No Delivery History',

                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight:
                                        FontWeight.bold,

                                    color: Colors
                                        .grey
                                        .shade700,
                                  ),
                                ),

                                const SizedBox(
                                  height: 10,
                                ),

                                Text(
                                  'AI delivery activity will appear here.',

                                  style: TextStyle(
                                    color: Colors
                                        .grey
                                        .shade600,
                                  ),
                                ),
                              ],
                            ),
                          )

                        : ListView.builder(

                            itemCount:
                                history.length,

                            itemBuilder:
                                (context,
                                    index) {

                              return buildHistoryCard(
                                history[index],
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