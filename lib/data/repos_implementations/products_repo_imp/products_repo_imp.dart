import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/core/constants/database_constants.dart';
import 'package:otex_flutter_task/core/database_result/database_result.dart';
import 'package:otex_flutter_task/data/db/db_service.dart';
import 'package:otex_flutter_task/data/models/product_model.dart';
import 'package:otex_flutter_task/domain/repos_contracts/products_repo/products_repo.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImp implements ProductsRepo {
  final DBService _dbService;

  ProductsRepoImp(this._dbService);

  @override
  Future<DatabaseResult<List<ProductModel>>> select({
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      final products = await _dbService.select<ProductModel>(
        tableName: DatabaseConstants.productsTable,
        columns: DatabaseConstants.productsTableColumns,
        where: where,
        whereArgs: whereArgs,
        fromMap: (records) {
          return records.map((record) => ProductModel.fromMap(record)).toList();
        },
      );
      return Success(products);
    } catch (e) {
      return Error(e);
    }
  }

  @override
  Future<DatabaseResult<List<ProductModel>>> selectAll() async {
    try {
      final products = await _dbService.select<ProductModel>(
        tableName: DatabaseConstants.productsTable,
        columns: DatabaseConstants.productsTableColumns,
        fromMap: (records) {
          return records.map((record) => ProductModel.fromMap(record)).toList();
        },
      );
      return Success(products);
    } catch (e) {
      return Error(e);
    }
  }
}
