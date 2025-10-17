import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/data/db/db_service.dart';
import 'package:otex_flutter_task/data/dummy/dummy_data.dart';

@injectable
class DummyDataProvider {
  final DBService _dbService;

  DummyDataProvider(this._dbService);

  Future<void> insertDummyData() async {
    await _dbService.insertMany(
      tableName: 'categories',
      values: DummyData.categories,
    );
    await _dbService.insertMany(
      tableName: 'subcategories',
      values: DummyData.subcategories,
    );
    await _dbService.insertMany(tableName: 'plans', values: DummyData.plans);
    await _dbService.insertMany(
      tableName: 'products',
      values: DummyData.products,
    );
    await _dbService.insertMany(tableName: 'Estates', values: DummyData.estates);
  }
}
