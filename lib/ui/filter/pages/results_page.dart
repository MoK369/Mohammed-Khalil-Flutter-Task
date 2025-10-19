import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/core/widgets/custom_product_cart.dart';
import 'package:otex_flutter_task/core/widgets/error_state_widget.dart';
import 'package:otex_flutter_task/ui/filter/manager/filter_screen_view_model.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends BaseStatefulWidgetState<ResultsPage> {
  late FilterScreenViewModel filterScreenViewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    filterScreenViewModel = BlocProvider.of<FilterScreenViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    if (filterScreenViewModel.state.filterStatus == StatusEnum.error) {
      return ErrorStateWidget(
        error: filterScreenViewModel.state.filterError.toString(),
      );
    } else {
      var resultsList = filterScreenViewModel.state.estatesResult ?? [];
      return resultsList.isEmpty
          ? Center(
              child: Text(
                appLocalizations.noItemsFound,
                style: theme.textTheme.titleLarge,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 2.1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: resultsList.length,
                itemBuilder: (context, index) {
                  return CustomProductCard(
                    imagePath: resultsList[index].imageUrl,
                    title: resultsList[index].title,
                    price: appLocalizations.price(resultsList[index].price),
                    sold: appLocalizations.sold(100),
                  );
                },
              ),
            );
    }
  }
}
