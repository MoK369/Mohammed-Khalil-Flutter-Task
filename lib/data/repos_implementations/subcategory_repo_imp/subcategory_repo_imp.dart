import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/core/constants/database_constants.dart';
import 'package:otex_flutter_task/core/database_result/database_result.dart';
import 'package:otex_flutter_task/data/db/db_service.dart';
import 'package:otex_flutter_task/data/models/subcategory_model.dart';
import 'package:otex_flutter_task/domain/repos_contracts/subcategory_repo/subcategory_repo.dart';

@Injectable(as: SubcategoryRepo)
class SubcategoryRepoImp implements SubcategoryRepo {
  final DBService _dbService;

  SubcategoryRepoImp(this._dbService);

  @override
  Future<DatabaseResult<List<SubcategoryModel>>> select({
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      final subcategories = await _dbService.select<SubcategoryModel>(
        tableName: DatabaseConstants.subcategoriesTable,
        columns: DatabaseConstants.subcategoriesTableColumns,
        where: where,
        whereArgs: whereArgs,
        fromMap: (records) {
          return records
              .map((record) => SubcategoryModel.fromMap(record))
              .toList();
        },
      );
      return Success(subcategories);
    } catch (e) {
      return Error(e);
    }
  }

  @override
  Future<DatabaseResult<List<SubcategoryModel>>> selectAll() async {
    try {
      final subcategories = await _dbService.select<SubcategoryModel>(
        tableName: DatabaseConstants.subcategoriesTable,
        columns: DatabaseConstants.subcategoriesTableColumns,
        fromMap: (records) {
          return records
              .map((record) => SubcategoryModel.fromMap(record))
              .toList();
        },
      );
      return Success(subcategories);
    } catch (e) {
      return Error(e);
    }
  }
}
