import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/core/widgets/custom_product_cart.dart';
import 'package:otex_flutter_task/core/widgets/error_state_widget.dart';
import 'package:otex_flutter_task/core/widgets/loading_state_widget.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_states.dart';
import 'package:otex_flutter_task/ui/home/pages/main/manager/main_page_view_model.dart';

class ItemsSection extends StatefulWidget {
  const ItemsSection({super.key});

  @override
  State<ItemsSection> createState() => _ItemsSectionState();
}

class _ItemsSectionState extends BaseStatefulWidgetState<ItemsSection> {
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
        if (previous.itemsStatus != current.itemsStatus) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                switch (state.itemsStatus) {
                  case StatusEnum.idle:
                  case StatusEnum.loading:
                    return const LoadingStateWidget();
                  case StatusEnum.success:
                    if ((state.productItems ?? []).isNotEmpty) {
                      final items = state.productItems ?? [];
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 2.1,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return CustomProductCard(
                            imagePath: items[index].imageUrl,
                            title: items[index].name,
                            price: appLocalizations.price(items[index].price),
                            discount: appLocalizations.price(
                              items[index].discount,
                            ),
                            sold: appLocalizations.sold(items[index].totalSold),
                          );
                        },
                      );
                    } else if ((state.estateItems ?? []).isNotEmpty) {
                      final items = state.estateItems ?? [];
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 2.1,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return CustomProductCard(
                            imagePath: items[index].imageUrl,
                            title: items[index].title,
                            price: appLocalizations.price(items[index].price),
                            sold: appLocalizations.sold(100),
                          );
                        },
                      );
                    }
                    return Center(
                      child: Text(
                        appLocalizations.noItemsFound,
                        style: theme.textTheme.titleLarge,
                      ),
                    );

                  case StatusEnum.error:
                    return ErrorStateWidget(error: state.itemsError.toString());
                }
              },
            ),
          ),
        );
      },
    );
  }
}
