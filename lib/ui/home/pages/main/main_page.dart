import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/core/di/di.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_states.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_view_model.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainPageViewModel,
      child: Scaffold(
        appBar: AppBar(
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
              onPressed: () {},
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
        body: BlocBuilder<MainPageViewModel, MainPageState>(
          builder: (context, state) {
            switch (state.categoriesStatus) {
              case StatusEnum.loading:
                return const Center(child: CircularProgressIndicator());
              case StatusEnum.idle:
              case StatusEnum.success:
                var categories = state.categories ?? [];
                return DefaultTabController(
                  length: categories.isEmpty ? 0 : categories.length + 1,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorPadding: const EdgeInsets.only(bottom: 1),
                        isScrollable: true,
                        onTap: (value) {},
                        tabs: List.generate(
                          categories.isEmpty ? 0 : categories.length + 1,
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
                      Center(
                        child: Text(
                          "Main Page",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                );
              case StatusEnum.error:
                return Text(
                  state.categoriesError.toString(),
                  style: theme.textTheme.titleLarge,
                );
            }
          },
        ),
      ),
    );
  }
}
