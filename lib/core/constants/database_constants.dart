abstract class DatabaseConstants {
  // table names
  static const String categoriesTable = "categories";
  static const List<String> categoriesTableColumns = ['id', 'name'];
  static const String subcategoriesTable = "subcategories";
  static const List<String> subcategoriesTableColumns = [
    'id',
    'name',
    'category_id',
    'image_url',
  ];
  static const String plansTable = "plans";
  static const List<String> plansTableColumns = [
    'id',
    'title',
    'price',
    'view_number',
    'features',
  ];
  static const String productsTable = "products";
  static const List<String> productsTableColumns = [
    'id',
    'name',
    'description',
    'price',
    'discount',
    'total_sold',
    'category_id',
    'subcategory_id',
    'image_url',
    'plan_id',
  ];
  static const String estatesTable = "Estates";

  static List<String> estatesTableColumns = [
    'id',
    'title',
    'description',
    'price',
    'category_id',
    'subcategory_id',
    'image_url',
    'plan_id',
    'location',
    'status',
    'type',
    'rooms',
    'monthly_payments',
    'payment_type',
  ];
}
