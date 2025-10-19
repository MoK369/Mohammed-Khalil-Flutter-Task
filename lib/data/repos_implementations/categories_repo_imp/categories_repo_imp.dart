import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/core/constants/database_constants.dart';
import 'package:otex_flutter_task/core/database_result/database_result.dart';
import 'package:otex_flutter_task/data/db/db_service.dart';
import 'package:otex_flutter_task/data/models/category_model.dart';
import 'package:otex_flutter_task/domain/repos_contracts/categories_repo/categories_repo.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImp implements CategoriesRepo {
  final DBService _dbService;

  CategoriesRepoImp(this._dbService);

  @override
  Future<DatabaseResult<List<CategoryModel>>> select({
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      var categories = await _dbService.select<CategoryModel>(
        tableName: DatabaseConstants.categoriesTable,
        columns: DatabaseConstants.categoriesTableColumns,
        where: where,
        whereArgs: whereArgs,
        fromMap: (records) {
          return records
              .map((record) => CategoryModel.fromMap(record))
              .toList();
        },
      );
      return Success(categories);
    } catch (e) {
      return Error(e);
    }
  }

  @override
  Future<DatabaseResult<List<CategoryModel>>> selectAll() async {
    try {
      final categories = await _dbService.select<CategoryModel>(
        tableName: DatabaseConstants.categoriesTable,
        columns: DatabaseConstants.categoriesTableColumns,
        fromMap: (records) {
          return records
              .map((record) => CategoryModel.fromMap(record))
              .toList();
        },
      );
      return Success(categories);
    } catch (e) {
      return Error(e);
    }
  }
}
