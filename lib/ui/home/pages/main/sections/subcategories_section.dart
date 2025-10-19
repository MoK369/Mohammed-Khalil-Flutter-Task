import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/core/widgets/error_state_widget.dart';
import 'package:otex_flutter_task/core/widgets/loading_state_widget.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_states.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_view_model.dart';
import 'package:otex_flutter_task/ui/home/pages/main/sections/items_section.dart';
import 'package:otex_flutter_task/ui/home/pages/main/widgets/custom_subcategory_widget.dart';

class SubcategoriesSection extends StatefulWidget {
  const SubcategoriesSection({super.key});

  @override
  State<SubcategoriesSection> createState() => _SubcategoriesSectionState();
}

class _SubcategoriesSectionState
    extends BaseStatefulWidgetState<SubcategoriesSection> {
  late MainPageViewModel mainPageViewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainPageViewModel = BlocProvider.of<MainPageViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageViewModel, MainPageState>(
      buildWhen: (previous, current) {
        if (previous.subcategoriesStatus != current.subcategoriesStatus) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              switch (state.subcategoriesStatus) {
                case StatusEnum.idle:
                case StatusEnum.loading:
                  return const LoadingStateWidget();
                case StatusEnum.success:
                  var subcategories = state.subcategories ?? [];
                  return subcategories.isEmpty
                      ? Center(
                          child: Text(
                            appLocalizations.noItemsFound,
                            style: theme.textTheme.titleLarge,
                          ),
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: max(
                                min(
                                  constraints.maxHeight / 5,
                                  constraints.maxHeight / 4,
                                ),
                                constraints.maxHeight / 7,
                              ),
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: subcategories.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      int id = subcategories[index].id!;
                                      mainPageViewModel.doIntent(
                                        subcategories[index].categoryId == 5
                                            ? GetEstatesIntent(categoryId: id)
                                            : GetProductsIntent(
                                                subCategory: id,
                                              ),
                                      );
                                    },
                                    child: CustomSubcategoryWidget(
                                      imagePath: subcategories[index].imageUrl,
                                      title: subcategories[index].name,
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
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.red.withAlpha(12),
                                      borderRadius:
                                          BorderRadiusGeometry.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: AppColors.green,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          appLocalizations.freeShipping,
                                          style: theme.textTheme.labelLarge!
                                              .copyWith(color: AppColors.green),
                                        ),
                                        const Spacer(),
                                        Text(
                                          appLocalizations.offerRightNow,
                                          style: theme.textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  // items section
                                  const ItemsSection(),
                                ],
                              ),
                            ),
                          ],
                        );

                case StatusEnum.error:
                  return ErrorStateWidget(
                    error: state.subcategoriesError.toString(),
                  );
              }
            },
          ),
        );
      },
    );
  }
}
