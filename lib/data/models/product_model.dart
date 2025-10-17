class ProductModel {
  final int? id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final int totalSold;
  final int categoryId;
  final int subcategoryId;
  final String imageUrl;
  final int planId;

  ProductModel({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.totalSold,
    required this.categoryId,
    required this.subcategoryId,
    required this.imageUrl,
    required this.planId,
  });

  // Convert a Product object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'total_sold': totalSold,
      'category_id': categoryId,
      'subcategory_id': subcategoryId,
      'image_url': imageUrl,
      'plan_id': planId,
    };
  }

  // Create a Product object from a Map
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'] is int ? (map['price'] as int).toDouble() : map['price'],
      discount: map['discount'] is int ? (map['discount'] as int).toDouble() : map['discount'],
      totalSold: map['total_sold'],
      categoryId: map['category_id'],
      subcategoryId: map['subcategory_id'],
      imageUrl: map['image_url'],
      planId: map['plan_id'],
    );
  }
}