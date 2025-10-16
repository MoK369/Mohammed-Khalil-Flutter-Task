import 'package:equatable/equatable.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/data/models/category_model.dart';

class MainPageState extends Equatable {
  final StatusEnum categoriesStatus;
  final List<CategoryModel>? categories;
  final Object? categoriesError;

  const MainPageState({
    this.categoriesStatus = StatusEnum.idle,
    this.categories,
    this.categoriesError,
  });

  @override
  List<Object?> get props => [categoriesStatus, categories, categoriesError];

  MainPageState copyWith({
    StatusEnum? categoriesStatus,
    List<CategoryModel>? categories,
    Object? categoriesError,
  }) {
    return MainPageState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categories: categories ?? this.categories,
      categoriesError: categoriesError ?? this.categoriesError,
    );
  }
}
