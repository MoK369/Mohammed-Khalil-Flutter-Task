import 'package:otex_flutter_task/core/database_result/database_result.dart';

abstract class BaseRepo<T> {
  Future<DatabaseResult<List<T>>> selectAll();

  Future<DatabaseResult<List<T>>> select({
    String? where,
    List<String>? whereArgs,
  });
}
