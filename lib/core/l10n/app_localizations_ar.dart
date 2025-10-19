// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get estates => 'عقارات';

  @override
  String get homePage => 'الرئيسية';

  @override
  String get chatsPage => 'محادثة';

  @override
  String get addAdPage => 'أضف أعلان';

  @override
  String get myAdsPage => 'أعلاناتى';

  @override
  String get accountPage => 'حسابى';

  @override
  String get exploreOffers => 'أستكشف العروض';

  @override
  String get all => 'الكل';

  @override
  String get allOffers => 'كل العروض';

  @override
  String get freeShipping => 'شحن مجانى';

  @override
  String get offerRightNow => 'لأى عرض تطلبه دلوقتى !';

  @override
  String sold(Object quantity) {
    return 'تم بيع $quantity';
  }

  @override
  String price(Object price) {
    return '$priceجم';
  }

  @override
  String get noItemsFound => 'لم يتم العثور على عناصر';

  @override
  String get validity => 'صلاحية';

  @override
  String get lifting => 'رفع';

  @override
  String get keeping => 'تثبيت';

  @override
  String get appearing => 'ظهور';

  @override
  String get special => 'مميز';

  @override
  String get chooseProperPlan => 'أختر الباقات اللى تناسبك';

  @override
  String get chooseFromSpecialBottomPlans =>
      'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك';

  @override
  String get doubleNumberOfView => 'ضعف عدد\nالمشاهدات';

  @override
  String get planPrice => 'ج.م';

  @override
  String get plansForYou => 'باقات مخصصة لك';

  @override
  String get contactUsForProperPlan => 'تواصل معنا لأختيار الباقة المناسبة لك';

  @override
  String get salesTeam => 'فريق المبيعات';

  @override
  String get next => 'التالى';
}
