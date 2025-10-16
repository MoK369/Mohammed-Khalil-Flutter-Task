class Subcategory {
  final int? id;
  final String name;
  final int categoryId;
  final String imageUrl;

  Subcategory({
    this.id,
    required this.name,
    required this.categoryId,
    required this.imageUrl,
  });

  // Convert a Subcategory object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category_id': categoryId,
      'image_url': imageUrl,
    };
  }

  // Create a Subcategory object from a Map
  factory Subcategory.fromMap(Map<String, dynamic> map) {
    return Subcategory(
      id: map['id'],
      name: map['name'],
      categoryId: map['category_id'],
      imageUrl: map['image_url'],
    );
  }
}