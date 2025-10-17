import 'dart:convert';

class PlanModel {
  final int? id;
  final String title;
  final double price;
  final String duration;
  final List<String> features;

  PlanModel({
    this.id,
    required this.title,
    required this.price,
    required this.duration,
    required this.features,
  });

  // Convert a Plan object into a Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'duration': duration,
      'features': jsonEncode(features), // Convert List<String> to JSON string
    };
  }

  // Create a Plan object from a Map from SQLite
  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
      id: map['id'],
      title: map['title'],
      price: map['price'] is int ? (map['price'] as int).toDouble() : map['price'],
      duration: map['duration'],
      features: List<String>.from(jsonDecode(map['features'])), // Convert JSON string to List<String>
    );
  }
}