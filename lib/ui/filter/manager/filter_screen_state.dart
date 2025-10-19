import 'package:equatable/equatable.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/data/models/estate_model.dart';

class FilterScreenState extends Equatable {
  final StatusEnum filterStatus;
  final List<EstateModel>? estatesResult;
  final Object? filterError;

  const FilterScreenState({
    this.filterStatus = StatusEnum.idle,
    this.estatesResult,
    this.filterError,
  });
  @override
  List<Object?> get props => [filterStatus, estatesResult, filterError];

  FilterScreenState copyWith({
    StatusEnum? filterStatus,
    List<EstateModel>? estatesResult,
    Object? filterError,
  }) {
    return FilterScreenState(
      filterStatus: filterStatus ?? this.filterStatus,
      estatesResult: estatesResult ?? this.estatesResult,
      filterError: filterError ?? this.filterError,
    );
  }
}
