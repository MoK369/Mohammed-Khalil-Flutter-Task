import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/core/di/di.dart';
import 'package:otex_flutter_task/core/routing/defined_routes.dart';
import 'package:otex_flutter_task/core/widgets/error_state_widget.dart';
import 'package:otex_flutter_task/core/widgets/loading_state_widget.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_states.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_view_model.dart';
import 'package:otex_flutter_task/ui/home/pages/main/sections/subcategories_section.dart';
import 'package:otex_flutter_task/ui/home/pages/main/widgets/custom_tab_child.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends BaseStatefulWidgetState<MainPage> {
  MainPageViewModel mainPageViewModel = getIt.get<MainPageViewModel>();
  @override
  void initState() {
    super.initState();
    mainPageViewModel.doIntent(GetCategoriesIntent());
    mainPageViewModel.doIntent(GetSubcategoriesIntent(categoryId: -1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainPageViewModel,
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text(appLocalizations.exploreOffers),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
          actions: [
            Text(
              appLocalizations.all,
              style: theme.textTheme.titleLarge!.copyWith(
                color: AppColors.black.withAlpha(125),
                fontWeight: FontWeight.w900,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, DefinedRoutes.filterScreen);
              },
              icon: Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.black.withAlpha(125),
                  size: 26,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: BlocBuilder<MainPageViewModel, MainPageState>(
            buildWhen: (previous, current) {
              if (previous.categoriesStatus != current.categoriesStatus) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              switch (state.categoriesStatus) {
                case StatusEnum.idle:
                case StatusEnum.loading:
                  return const LoadingStateWidget();
                case StatusEnum.success:
                  var categories = state.categories ?? [];
                  return categories.isEmpty
                      ? Center(
                          child: Text(
                            appLocalizations.noItemsFound,
                            style: theme.textTheme.titleLarge,
                          ),
                        )
                      : DefaultTabController(
                          length: categories.isEmpty
                              ? 0
                              : categories.length + 1,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              TabBar(
                                indicatorPadding: const EdgeInsets.only(
                                  bottom: 1,
                                ),
                                isScrollable: true,
                                onTap: (value) {
                                  mainPageViewModel.doIntent(
                                    GetSubcategoriesIntent(
                                      categoryId: value - 1 > -1
                                          ? (categories[value - 1].id ?? -1)
                                          : -1,
                                    ),
                                  );
                                },
                                tabs: List.generate(
                                  categories.isEmpty
                                      ? 0
                                      : categories.length + 1,
                                  (index) {
                                    return CustomTabChild(
                                      title: index == 0
                                          ? appLocalizations.allOffers
                                          : categories[index - 1].name,
                                      isSelected: index == 0,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 25),
                              // subcategories section
                              const SubcategoriesSection(),
                            ],
                          ),
                        );
                case StatusEnum.error:
                  return ErrorStateWidget(
                    error: state.categoriesError.toString(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
