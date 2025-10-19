// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/db/db_service.dart' as _i174;
import '../../data/dummy/dummy_data_provider.dart' as _i901;
import '../../data/repos_implementations/categories_repo_imp/categories_repo_imp.dart'
    as _i414;
import '../../data/repos_implementations/estates_repo_imp/estates_repo_imp.dart'
    as _i516;
import '../../data/repos_implementations/plans_repo_imp/plans_repo_imp.dart'
    as _i371;
import '../../data/repos_implementations/products_repo_imp/products_repo_imp.dart'
    as _i568;
import '../../data/repos_implementations/subcategory_repo_imp/subcategory_repo_imp.dart'
    as _i198;
import '../../domain/repos_contracts/categories_repo/categories_repo.dart'
    as _i98;
import '../../domain/repos_contracts/estates_repo/estates_repo.dart' as _i536;
import '../../domain/repos_contracts/plans_repo/plans_repo.dart' as _i466;
import '../../domain/repos_contracts/products_repo/products_repo.dart' as _i315;
import '../../domain/repos_contracts/subcategory_repo/subcategory_repo.dart'
    as _i1039;
import '../../ui/filter/manager/filter_screen_view_model.dart' as _i491;
import '../../ui/home/manager/home_screen_view_model.dart' as _i782;
import '../../ui/home/pages/main/manager/main_page_view_model.dart' as _i735;
import '../../ui/plans/manager/plans_screen_view_model.dart' as _i162;
import '../app_localization_provider/app_localization_provider.dart' as _i503;
import '../l10n/app_localizations.dart' as _i209;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appLocalizationProvider = _$AppLocalizationProvider();
    gh.factory<_i782.HomeScreenViewModel>(() => _i782.HomeScreenViewModel());
    await gh.factoryAsync<_i209.AppLocalizations>(
      () => appLocalizationProvider.provide(),
      preResolve: true,
    );
    gh.singleton<_i174.DBService>(() => _i174.DBService());
    gh.factory<_i901.DummyDataProvider>(
      () => _i901.DummyDataProvider(gh<_i174.DBService>()),
    );
    gh.factory<_i536.EstatesRepo>(
      () => _i516.EstatesRepoImp(gh<_i174.DBService>()),
    );
    gh.factory<_i98.CategoriesRepo>(
      () => _i414.CategoriesRepoImp(gh<_i174.DBService>()),
    );
    gh.factory<_i315.ProductsRepo>(
      () => _i568.ProductsRepoImp(gh<_i174.DBService>()),
    );
    gh.factory<_i466.PlansRepo>(
      () => _i371.PlansRepoImp(gh<_i174.DBService>()),
    );
    gh.factory<_i162.PlansScreenViewModel>(
      () => _i162.PlansScreenViewModel(gh<_i466.PlansRepo>()),
    );
    gh.factory<_i1039.SubcategoryRepo>(
      () => _i198.SubcategoryRepoImp(gh<_i174.DBService>()),
    );
    gh.factory<_i735.MainPageViewModel>(
      () => _i735.MainPageViewModel(
        gh<_i98.CategoriesRepo>(),
        gh<_i1039.SubcategoryRepo>(),
        gh<_i315.ProductsRepo>(),
        gh<_i536.EstatesRepo>(),
      ),
    );
    gh.factory<_i491.FilterScreenViewModel>(
      () => _i491.FilterScreenViewModel(gh<_i536.EstatesRepo>()),
    );
    return this;
  }
}

class _$AppLocalizationProvider extends _i503.AppLocalizationProvider {}
