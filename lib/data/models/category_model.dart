class CategoryModel {
  final int? id;
  final String name;

  CategoryModel({this.id, required this.name});

  // Convert a Category object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Create a Category object from a Map
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
    );
  }
}