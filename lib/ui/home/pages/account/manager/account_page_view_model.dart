import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/core/constants/assets_paths.dart';
import 'package:otex_flutter_task/core/di/di.dart';
import 'package:otex_flutter_task/core/l10n/app_localizations.dart';
import 'package:otex_flutter_task/domain/repos_contracts/plans_repo/plans_repo.dart';
import 'package:otex_flutter_task/ui/home/pages/account/manager/account_page_state.dart';

@injectable
class AccountPageViewModel extends Cubit<AccountPageState> {
  final PlansRepo _plansRepo;

  AccountPageViewModel(this._plansRepo) : super(const AccountPageState());

  Map<String, String> get keywordIconMap {
    var appLocalization = getIt.get<AppLocalizations>();
    return {
      appLocalization.validity: AssetsPaths.timeIcon,
      appLocalization.lifting: AssetsPaths.rocketIcon,
      appLocalization.keeping: AssetsPaths.keepIcon,
      appLocalization.appearing: AssetsPaths.globeIcon,
      appLocalization.special: AssetsPaths.specialIcon,
    };
  }
}
