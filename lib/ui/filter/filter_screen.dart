import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/ui/filter/manager/filter_screen_view_model.dart';
import 'package:otex_flutter_task/ui/filter/pages/filtering_page.dart';
import 'package:otex_flutter_task/ui/filter/pages/results_page.dart';
import '../../core/di/di.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends BaseStatefulWidgetState<FilterScreen> {
  FilterScreenViewModel filterScreenViewModel = getIt
      .get<FilterScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => filterScreenViewModel,
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () {
              filterScreenViewModel.doIntent(OnClickingOnCloseButtonIntent());
            },
            icon: const Icon(Icons.close),
          ),
          title: Text(appLocalizations.filtering),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                appLocalizations.returnToDefault,
                style: theme.textTheme.labelLarge!.copyWith(
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        body: PageView(
          controller: filterScreenViewModel.pageController,
          children: [const FilteringPage(), const ResultsPage()],
        ),
      ),
    );
  }
}
