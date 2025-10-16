import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/core/database_result/database_result.dart';
import 'package:otex_flutter_task/data/models/category_model.dart';
import 'package:otex_flutter_task/domain/repos_contracts/categories_repo/categories_repo.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_states.dart';

@injectable
class MainPageViewModel extends Cubit<MainPageState> {
  final CategoriesRepo _categoriesRepo;

  MainPageViewModel(this._categoriesRepo) : super(const MainPageState());

  void doIntent(MainPageIntents intent) {
    switch (intent) {
      case GetCategoriesIntent():
        _getCategories();
        break;
    }
  }


  void _getCategories() async {
    emit(const MainPageState(categoriesStatus: StatusEnum.loading));
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
}

sealed class MainPageIntents {}

class GetCategoriesIntent extends MainPageIntents {}
