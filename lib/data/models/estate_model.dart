class EstateModel {
  final int? id;
  final String title;
  final String description;
  final double price;
  final int categoryId;
  final int subcategoryId;
  final String imageUrl;
  final int planId;
  final String location;
  final String status;
  final String type;
  final int rooms;
  final double monthlyPayments;
  final String paymentType;

  EstateModel({
    this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.subcategoryId,
    required this.imageUrl,
    required this.planId,
    required this.location,
    required this.status,
    required this.type,
    required this.rooms,
    required this.monthlyPayments,
    required this.paymentType,
  });

  // Convert an Estate object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category_id': categoryId,
      'subcategory_id': subcategoryId,
      'image_url': imageUrl,
      'plan_id': planId,
      'location': location,
      'status': status,
      'type': type,
      'rooms': rooms,
      'monthly_payments': monthlyPayments,
      'payment_type': paymentType,
    };
  }

  // Create an Estate object from a Map
  factory EstateModel.fromMap(Map<String, dynamic> map) {
    return EstateModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'] is int ? (map['price'] as int).toDouble() : map['price'],
      categoryId: map['category_id'],
      subcategoryId: map['subcategory_id'],
      imageUrl: map['image_url'],
      planId: map['plan_id'],
      location: map['location'],
      status: map['status'],
      type: map['type'],
      rooms: map['rooms'],
      monthlyPayments: map['monthly_payments'] is int
          ? (map['monthly_payments'] as int).toDouble()
          : map['monthly_payments'],
      paymentType: map['payment_type'],
    );
  }
}