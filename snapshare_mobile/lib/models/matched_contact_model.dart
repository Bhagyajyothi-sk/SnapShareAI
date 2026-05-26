class MatchedContactModel {
  final String id;
  final String name;
  final String email;

  MatchedContactModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory MatchedContactModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return MatchedContactModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}