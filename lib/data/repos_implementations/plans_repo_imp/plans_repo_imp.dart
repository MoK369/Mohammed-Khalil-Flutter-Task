import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/core/constants/database_constants.dart';
import 'package:otex_flutter_task/core/database_result/database_result.dart';
import 'package:otex_flutter_task/data/db/db_service.dart';
import 'package:otex_flutter_task/data/models/plans_model.dart';
import 'package:otex_flutter_task/domain/repos_contracts/plans_repo/plans_repo.dart';

@Injectable(as: PlansRepo)
class PlansRepoImp implements PlansRepo {
  final DBService _dbService;

  PlansRepoImp(this._dbService);

  @override
  Future<DatabaseResult<List<PlanModel>>> select({
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      final plans = await _dbService.select<PlanModel>(
        tableName: DatabaseConstants.plansTable,
        columns: DatabaseConstants.plansTableColumns,
        where: where,
        whereArgs: whereArgs,
        fromMap: (records) {
          return records.map((record) => PlanModel.fromMap(record)).toList();
        },
      );
      return Success(plans);
    } catch (e) {
      return Error(e);
    }
  }

  @override
  Future<DatabaseResult<List<PlanModel>>> selectAll() async {
    try {
      final plans = await _dbService.select<PlanModel>(
        tableName: DatabaseConstants.plansTable,
        columns: DatabaseConstants.plansTableColumns,
        fromMap: (records) {
          return records.map((record) => PlanModel.fromMap(record)).toList();
        },
      );
      return Success(plans);
    } catch (e) {
      return Error(e);
    }
  }
}
