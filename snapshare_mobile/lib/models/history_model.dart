class HistoryModel {
  final String filename;
  final List matchedPeople;
  final int totalFacesDetected;

  HistoryModel({
    required this.filename,
    required this.matchedPeople,
    required this.totalFacesDetected,
  });

  factory HistoryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return HistoryModel(
      filename: json['filename'] ?? '',
      matchedPeople:
          json['matched_people'] ?? [],
      totalFacesDetected:
          json['total_faces_detected'] ?? 0,
    );
  }
}