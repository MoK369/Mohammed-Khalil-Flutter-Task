import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/core/di/di.dart';
import 'package:otex_flutter_task/core/routing/defined_routes.dart';
import 'package:otex_flutter_task/core/widgets/custom_product_cart.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_states.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_view_model.dart';
import 'package:otex_flutter_task/ui/home/pages/main/widgets/custom_subcategory_widget.dart';
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
            builder: (context, state) {
              switch (state.categoriesStatus) {
                case StatusEnum.idle:
                case StatusEnum.loading:
                  return const CircularProgressIndicator();
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
                              Expanded(
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    switch (state.subcategoriesStatus) {
                                      case StatusEnum.idle:
                                      case StatusEnum.loading:
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      case StatusEnum.success:
                                        var subcategories =
                                            state.subcategories ?? [];
                                        return subcategories.isEmpty
                                            ? Expanded(
                                                child: Center(
                                                  child: Text(
                                                    appLocalizations
                                                        .noItemsFound,
                                                    style: theme
                                                        .textTheme
                                                        .titleLarge,
                                                  ),
                                                ),
                                              )
                                            : Column(
                                                children: [
                                                  SizedBox(
                                                    height: max(
                                                      min(
                                                        constraints.maxHeight /
                                                            5,
                                                        constraints.maxHeight /
                                                            4,
                                                      ),
                                                      constraints.maxHeight / 7,
                                                    ),
                                                    child: ListView.builder(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 4,
                                                          ),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          subcategories.length,
                                                      itemBuilder: (context, index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            int id =
                                                                subcategories[index]
                                                                    .id!;
                                                            mainPageViewModel.doIntent(
                                                              subcategories[index]
                                                                          .categoryId ==
                                                                      5
                                                                  ? GetEstatesIntent(
                                                                      categoryId:
                                                                          id,
                                                                    )
                                                                  : GetProductsIntent(
                                                                      subCategory:
                                                                          id,
                                                                    ),
                                                            );
                                                          },
                                                          child: CustomSubcategoryWidget(
                                                            imagePath:
                                                                subcategories[index]
                                                                    .imageUrl,
                                                            title:
                                                                subcategories[index]
                                                                    .name,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 16,
                                                              ),
                                                          padding:
                                                              const EdgeInsets.all(
                                                                8,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            color: AppColors.red
                                                                .withAlpha(12),
                                                            borderRadius:
                                                                BorderRadiusGeometry.circular(
                                                                  5,
                                                                ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.check,
                                                                color: AppColors
                                                                    .green,
                                                              ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              Text(
                                                                appLocalizations
                                                                    .freeShipping,
                                                                style: theme
                                                                    .textTheme
                                                                    .labelLarge!
                                                                    .copyWith(
                                                                      color: AppColors
                                                                          .green,
                                                                    ),
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                appLocalizations
                                                                    .offerRightNow,
                                                                style: theme
                                                                    .textTheme
                                                                    .labelMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      16.0,
                                                                ),
                                                            child: LayoutBuilder(
                                                              builder:
                                                                  (
                                                                    context,
                                                                    constraints,
                                                                  ) {
                                                                    switch (state
                                                                        .itemsStatus) {
                                                                      case StatusEnum
                                                                          .idle:
                                                                      case StatusEnum
                                                                          .loading:
                                                                        return const Center(
                                                                          child:
                                                                              CircularProgressIndicator(),
                                                                        );
                                                                      case StatusEnum
                                                                          .success:
                                                                        if ((state.productItems ??
                                                                                [])
                                                                            .isNotEmpty) {
                                                                          final items =
                                                                              state.productItems ??
                                                                              [];
                                                                          return GridView.builder(
                                                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                              crossAxisCount: 2,
                                                                              childAspectRatio:
                                                                                  1 /
                                                                                  2.1,
                                                                              crossAxisSpacing: 12,
                                                                              mainAxisSpacing: 12,
                                                                            ),
                                                                            itemCount:
                                                                                items.length,
                                                                            itemBuilder:
                                                                                (
                                                                                  context,
                                                                                  index,
                                                                                ) {
                                                                                  return CustomProductCard(
                                                                                    imagePath: items[index].imageUrl,
                                                                                    title: items[index].name,
                                                                                    price: appLocalizations.price(
                                                                                      items[index].price,
                                                                                    ),
                                                                                    discount: appLocalizations.price(
                                                                                      items[index].discount,
                                                                                    ),
                                                                                    sold: appLocalizations.sold(
                                                                                      items[index].totalSold,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                          );
                                                                        } else if ((state.estateItems ??
                                                                                [])
                                                                            .isNotEmpty) {
                                                                          final items =
                                                                              state.estateItems ??
                                                                              [];
                                                                          return GridView.builder(
                                                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                              crossAxisCount: 2,
                                                                              childAspectRatio:
                                                                                  1 /
                                                                                  2.1,
                                                                              crossAxisSpacing: 12,
                                                                              mainAxisSpacing: 12,
                                                                            ),
                                                                            itemCount:
                                                                                items.length,
                                                                            itemBuilder:
                                                                                (
                                                                                  context,
                                                                                  index,
                                                                                ) {
                                                                                  return CustomProductCard(
                                                                                    imagePath: items[index].imageUrl,
                                                                                    title: items[index].title,
                                                                                    price: appLocalizations.price(
                                                                                      items[index].price,
                                                                                    ),
                                                                                    sold: appLocalizations.sold(
                                                                                      100,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                          );
                                                                        }
                                                                        return Center(
                                                                          child: Text(
                                                                            appLocalizations.noItemsFound,
                                                                            style:
                                                                                theme.textTheme.titleLarge,
                                                                          ),
                                                                        );

                                                                      case StatusEnum
                                                                          .error:
                                                                        return Text(
                                                                          state
                                                                              .itemsError
                                                                              .toString(),
                                                                          style: theme
                                                                              .textTheme
                                                                              .titleLarge,
                                                                        );
                                                                    }
                                                                  },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );

                                      case StatusEnum.error:
                                        return Text(
                                          state.subcategoriesError.toString(),
                                          style: theme.textTheme.titleLarge,
                                        );
                                    }
                                  },
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
      ),
    );
  }
}
