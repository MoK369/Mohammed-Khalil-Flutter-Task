import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/core/constants/database_constants.dart';
import 'package:otex_flutter_task/core/database_result/database_result.dart';
import 'package:otex_flutter_task/data/db/db_service.dart';
import 'package:otex_flutter_task/data/models/estate_model.dart';
import 'package:otex_flutter_task/domain/repos_contracts/estates_repo/estates_repo.dart';

@Injectable(as: EstatesRepo)
class EstatesRepoImp implements EstatesRepo {
  final DBService _dbService;

  EstatesRepoImp(this._dbService);

  @override
  Future<DatabaseResult<List<EstateModel>>> select({
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      final estates = await _dbService.select<EstateModel>(
        tableName: DatabaseConstants.estatesTable,
        columns: DatabaseConstants.estatesTableColumns,
        where: where,
        whereArgs: whereArgs,
        fromMap: (records) {
          return records.map((record) => EstateModel.fromMap(record)).toList();
        },
      );
      return Success(estates);
    } catch (e) {
      return Error(e);
    }
  }

  @override
  Future<DatabaseResult<List<EstateModel>>> selectAll() async {
    try {
      final estates = await _dbService.select<EstateModel>(
        tableName: DatabaseConstants.estatesTable,
        columns: DatabaseConstants.estatesTableColumns,
        fromMap: (records) {
          return records.map((record) => EstateModel.fromMap(record)).toList();
        },
      );
      return Success(estates);
    } catch (e) {
      return Error(e);
    }
  }
}
