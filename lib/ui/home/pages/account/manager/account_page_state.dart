import 'package:equatable/equatable.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/data/models/plans_model.dart';

class AccountPageState extends Equatable {
  final StatusEnum plansStatus;
  final List<PlanModel>? plans;
  final Object? plansError;

  const AccountPageState({
    this.plansStatus = StatusEnum.idle,
    this.plans,
    this.plansError,
  });

  @override
  List<Object?> get props => [plansStatus, plans, plansError];

  AccountPageState copyWith({
    StatusEnum? plansStatus,
    List<PlanModel>? plans,
    Object? plansError,
  }) {
    return AccountPageState(
      plansStatus: plansStatus ?? this.plansStatus,
      plans: plans ?? this.plans,
      plansError: plansError ?? this.plansError,
    );
  }
}
