class DummyData {
  static final categories = [
    {'id': 1, 'name': "'عقارات'"},
    {'id': 2, 'name': "'منتجات تجميل'"},
    {'id': 3, 'name': "'إلكترونيات'"},
    {'id': 4, 'name': "'إكسسوارات'"},
    {'id': 5, 'name': "'ملابس'"},
  ];

  static final subcategories = [
    {
      'id': 1,
      'name': "'فلل'",
      'category_id': 1,
      'image_url': "'assets/images/villa.png'",
    },
    {
      'id': 2,
      'name': "'منتجات تجميل'",
      'category_id': 2,
      'image_url': "'assets/images/beauty.png'",
    },
    {
      'id': 3,
      'name': "'موبايلات'",
      'category_id': 3,
      'image_url': "'assets/images/mobile.png'",
    },
    {
      'id': 4,
      'name': "'ساعات'",
      'category_id': 4,
      'image_url': "'assets/images/watch.png'",
    },
    {
      'id': 5,
      'name': "'موضة رجال'",
      'category_id': 5,
      'image_url': "'assets/images/fashion_men.png'",
    },
  ];

  static final plans = [
    {
      'id': 1,
      'title': "'الخطة الأساسية'",
      'price': 10.0,
      'duration': "'7 أيام'",
      'features':
      '\'["تثبيت في الصفحة الرئيسية", "ظهور في الأعلى", "تثبيت في مقاول صحي في الجهراء"]\'',
    },
    {
      'id': 2,
      'title': "'الخطة المميزة'",
      'price': 25.0,
      'duration': "'14 يوم'",
      'features':
      '\'["تثبيت في الصفحة الرئيسية", "ظهور في الأعلى", "ترويج في وسائل التواصل"]\'',
    },
  ];

  static final products = [
    {
      'id': 1,
      'name': "'هاتف سامسونج'",
      'description': "'هاتف ذكي بشاشة AMOLED وكاميرا عالية الجودة'",
      'price': 3500.0,
      'discount': 500.0,
      'total_sold': 120,
      'category_id': 3,
      'subcategory_id': 3,
      'image_url': "'assets/images/samsung_phone.png'",
      'plan_id': 1,
    },
    {
      'id': 2,
      'name': "'ساعة ذكية'",
      'description': "'ساعة ذكية مقاومة للماء مع تتبع اللياقة'",
      'price': 800.0,
      'discount': 100.0,
      'total_sold': 75,
      'category_id': 4,
      'subcategory_id': 4,
      'image_url': "'assets/images/smart_watch.png'",
      'plan_id': 2,
    },
  ];

  static final estates = [
    {
      'id': 1,
      'title': "'فيلا فاخرة في الجهراء'",
      'description': "'فيلا مكونة من 5 غرف نوم وحديقة خاصة'",
      'price': 1200000.0,
      'category_id': 1,
      'subcategory_id': 1,
      'image_url': "'assets/images/villa_luxury.png'",
      'plan_id': 1,
      'location': "'الجهراء، الكويت'",
      'status': "'متاحة'",
      'type': "'فيلا'",
      'rooms': 5,
      'monthly_payments': 2500.0,
      'payment_type': "'شهري'",
    },
    {
      'id': 2,
      'title': "'شقة في حولي'",
      'description': "'شقة مكونة من 3 غرف وصالة'",
      'price': 450000.0,
      'category_id': 1,
      'subcategory_id': 1,
      'image_url': "'assets/images/apartment.png'",
      'plan_id': 2,
      'location': "'حولي، الكويت'",
      'status': "'مباعة'",
      'type': "'شقة'",
      'rooms': 3,
      'monthly_payments': 1500.0,
      'payment_type': "'شهري'",
    },
  ];
}
