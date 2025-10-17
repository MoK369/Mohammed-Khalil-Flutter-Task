import 'package:equatable/equatable.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/data/models/category_model.dart';
import 'package:otex_flutter_task/data/models/estate_model.dart';
import 'package:otex_flutter_task/data/models/product_model.dart';
import 'package:otex_flutter_task/data/models/subcategory_model.dart';

class MainPageState extends Equatable {
  final StatusEnum categoriesStatus;
  final List<CategoryModel>? categories;
  final Object? categoriesError;

  final StatusEnum subcategoriesStatus;
  final List<SubcategoryModel>? subcategories;
  final Object? subcategoriesError;

  final StatusEnum itemsStatus;
  final List<ProductModel>? productItems;
  final List<EstateModel>? estateItems;
  final Object? itemsError;

  const MainPageState({
    this.categoriesStatus = StatusEnum.idle,
    this.categories,
    this.categoriesError,
    this.subcategoriesStatus = StatusEnum.idle,
    this.subcategories,
    this.subcategoriesError,
    this.itemsStatus = StatusEnum.idle,
    this.productItems,
    this.estateItems,
    this.itemsError,
  });

  @override
  List<Object?> get props => [
    categoriesStatus,
    categories,
    categoriesError,
    subcategoriesStatus,
    subcategories,
    subcategoriesError,
    itemsStatus,
    productItems,
    estateItems,
    itemsError,
  ];

  MainPageState copyWith({
    StatusEnum? categoriesStatus,
    List<CategoryModel>? categories,
    Object? categoriesError,
    StatusEnum? subcategoriesStatus,
    List<SubcategoryModel>? subcategories,
    Object? subcategoriesError,
    StatusEnum? itemsStatus,
    List<ProductModel>? productItems,
    List<EstateModel>? estateItems,
    Object? itemsError,
  }) {
    return MainPageState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categories: categories ?? this.categories,
      categoriesError: categoriesError ?? this.categoriesError,
      subcategoriesStatus: subcategoriesStatus ?? this.subcategoriesStatus,
      subcategories: subcategories ?? this.subcategories,
      subcategoriesError: subcategoriesError ?? this.subcategoriesError,
      itemsStatus: itemsStatus ?? this.itemsStatus,
      productItems: productItems ?? this.productItems,
      estateItems: estateItems ?? this.estateItems,
      itemsError: itemsError ?? this.itemsError,
    );
  }
}
