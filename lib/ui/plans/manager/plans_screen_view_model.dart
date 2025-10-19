import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/core/constants/assets_paths.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/core/database_result/database_result.dart';
import 'package:otex_flutter_task/core/di/di.dart';
import 'package:otex_flutter_task/core/l10n/app_localizations.dart';
import 'package:otex_flutter_task/data/models/plans_model.dart';
import 'package:otex_flutter_task/domain/repos_contracts/plans_repo/plans_repo.dart';
import 'package:otex_flutter_task/ui/plans/manager/plans_screen_state.dart';

@injectable
class PlansScreenViewModel extends Cubit<PlansScreenState> {
  final PlansRepo _plansRepo;

  PlansScreenViewModel(this._plansRepo) : super(const PlansScreenState());

  void doIntent(AccountPageIntent intent) {
    switch (intent) {
      case GetPlansIntent():
        _getPlans();
        break;
    }
  }

  static Map<String, String> get _keywordIconMap {
    var appLocalization = getIt.get<AppLocalizations>();
    return {
      appLocalization.validity: AssetsPaths.timeIcon,
      appLocalization.lifting: AssetsPaths.rocketIcon,
      appLocalization.keeping: AssetsPaths.keepIcon,
      appLocalization.appearing: AssetsPaths.globeIcon,
      appLocalization.special: AssetsPaths.specialIcon,
    };
  }

  void _getPlans() async {
    emit(state.copyWith(plansStatus: StatusEnum.loading));
    var repoResult = await _plansRepo.selectAll();

    switch (repoResult) {
      case Success<List<PlanModel>>():
        emit(
          state.copyWith(
            plansStatus: StatusEnum.success,
            plans: repoResult.data,
          ),
        );

      case Error<List<PlanModel>>():
        emit(
          state.copyWith(
            plansStatus: StatusEnum.error,
            plansError: repoResult.error,
          ),
        );
    }
  }

  static String getIconForFeature(String featureText) {
    for (var entry in _keywordIconMap.entries) {
      if (featureText.contains(entry.key)) {
        return entry.value;
      }
    }
    return AssetsPaths.helpOutlineIcon;
  }
}

sealed class AccountPageIntent {}

class GetPlansIntent extends AccountPageIntent {}
