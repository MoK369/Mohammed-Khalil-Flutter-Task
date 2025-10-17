import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/core/constants/database_constants.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/core/database_result/database_result.dart';
import 'package:otex_flutter_task/data/models/category_model.dart';
import 'package:otex_flutter_task/data/models/estate_model.dart';
import 'package:otex_flutter_task/data/models/product_model.dart';
import 'package:otex_flutter_task/data/models/subcategory_model.dart';
import 'package:otex_flutter_task/domain/repos_contracts/categories_repo/categories_repo.dart';
import 'package:otex_flutter_task/domain/repos_contracts/estates_repo/estates_repo.dart';
import 'package:otex_flutter_task/domain/repos_contracts/products_repo/products_repo.dart';
import 'package:otex_flutter_task/domain/repos_contracts/subcategory_repo/subcategory_repo.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_states.dart';

@injectable
class MainPageViewModel extends Cubit<MainPageState> {
  final CategoriesRepo _categoriesRepo;
  final SubcategoryRepo _subcategoryRepo;
  final ProductsRepo _productsRepo;
  final EstatesRepo _estatesRepo;

  MainPageViewModel(
    this._categoriesRepo,
    this._subcategoryRepo,
    this._productsRepo,
    this._estatesRepo,
  ) : super(const MainPageState());

  void doIntent(MainPageIntents intent) {
    switch (intent) {
      case GetCategoriesIntent():
        _getCategories();
        break;
      case GetSubcategoriesIntent():
        _getSubcategories(intent.categoryId);
        break;
      case GetProductsIntent():
        _getProducts(intent.subCategory);
        break;
      case GetEstatesIntent():
        _getEstates(intent.categoryId);
        break;
    }
  }

  void _getCategories() async {
    emit(state.copyWith(categoriesStatus: StatusEnum.loading));
    var repoResult = await _categoriesRepo.selectAll();
    switch (repoResult) {
      case Success<List<CategoryModel>>():
        emit(
          state.copyWith(
            categoriesStatus: StatusEnum.success,
            categories: repoResult.data,
          ),
        );
      case Error<List<CategoryModel>>():
        emit(
          state.copyWith(
            categoriesStatus: StatusEnum.error,
            categoriesError: repoResult.error,
          ),
        );
    }
  }

  int currentSelectedCategoryId = -2;
  void _getSubcategories(int categoryId) async {
    if (currentSelectedCategoryId == categoryId) return;
    currentSelectedCategoryId = categoryId;
    emit(state.copyWith(subcategoriesStatus: StatusEnum.loading));
    var repoResult = await _subcategoryRepo.select(
      where: categoryId == -1
          ? null
          : "${DatabaseConstants.subcategoriesTableColumns[2]} = ?",
      whereArgs: categoryId == -1 ? null : ['$categoryId'],
    );
    switch (repoResult) {
      case Success<List<SubcategoryModel>>():
        emit(
          state.copyWith(
            subcategoriesStatus: StatusEnum.success,
            subcategories: repoResult.data,
          ),
        );
        if (repoResult.data.isNotEmpty) {
          repoResult.data[0].categoryId == 5
              ? _getEstates(repoResult.data[0].id!)
              : _getProducts(repoResult.data[0].id!);
          currentSubcategoryId = repoResult.data[0].id!;
        }
      case Error<List<SubcategoryModel>>():
        emit(
          state.copyWith(
            subcategoriesStatus: StatusEnum.error,
            subcategoriesError: repoResult.error,
          ),
        );
    }
  }

  int currentSubcategoryId = -1;
  void _getProducts(int subcategoryId) async {
    if (currentSubcategoryId == subcategoryId) return;
    currentSubcategoryId = subcategoryId;
    emit(state.copyWith(itemsStatus: StatusEnum.loading, estateItems: []));
    var repoResult = await _productsRepo.select(
      where: "${DatabaseConstants.productsTableColumns[7]} = ?",
      whereArgs: ['$subcategoryId'],
    );
    switch (repoResult) {
      case Success<List<ProductModel>>():
        emit(
          state.copyWith(
            itemsStatus: StatusEnum.success,
            productItems: repoResult.data,
          ),
        );
      case Error<List<ProductModel>>():
        emit(
          state.copyWith(
            itemsStatus: StatusEnum.error,
            itemsError: repoResult.error,
          ),
        );
    }
  }

  void _getEstates(int subcategoryId) async {
    if (currentSubcategoryId == subcategoryId) return;
    currentSubcategoryId = subcategoryId;
    emit(state.copyWith(itemsStatus: StatusEnum.loading, productItems: []));
    var repoResult = await _estatesRepo.select(
      where: "${DatabaseConstants.estatesTableColumns[5]} = ?",
      whereArgs: ['$subcategoryId'],
    );
    switch (repoResult) {
      case Success<List<EstateModel>>():
        emit(
          state.copyWith(
            itemsStatus: StatusEnum.success,
            estateItems: repoResult.data,
          ),
        );
      case Error<List<EstateModel>>():
        emit(
          state.copyWith(
            itemsStatus: StatusEnum.error,
            itemsError: repoResult.error,
          ),
        );
    }
  }
}

sealed class MainPageIntents {}

class GetCategoriesIntent extends MainPageIntents {}

class GetSubcategoriesIntent extends MainPageIntents {
  final int categoryId;

  GetSubcategoriesIntent({required this.categoryId});
}

class GetProductsIntent extends MainPageIntents {
  final int subCategory;

  GetProductsIntent({required this.subCategory});
}

class GetEstatesIntent extends MainPageIntents {
  final int categoryId;

  GetEstatesIntent({required this.categoryId});
}
