import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/core/constants/assets_paths.dart';
import 'package:otex_flutter_task/ui/filter/constants/filter_screen_constants.dart';
import 'package:otex_flutter_task/ui/filter/manager/filter_screen_view_model.dart';
import 'package:otex_flutter_task/ui/filter/sections/location_section.dart';
import 'package:otex_flutter_task/ui/filter/widgets/custom_opitons_widget.dart';
import 'package:otex_flutter_task/ui/filter/widgets/custom_range_prices_widget.dart';

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
              Navigator.pop(context);
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: ListView(
            children: [
              Text(
                appLocalizations.category,
                style: theme.textTheme.labelLarge!.copyWith(
                  color: AppColors.black.withAlpha(125),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  AssetsPaths.estateProviderIcon,
                  width: 25,
                ),
                contentPadding: const EdgeInsets.only(right: 8),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appLocalizations.estates,
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      appLocalizations.villasForSale,
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: AppColors.black.withAlpha(125),
                      ),
                    ),
                  ],
                ),
                trailing: InkWell(
                  onTap: () {},
                  child: Text(
                    appLocalizations.changing,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const LocationSection(),
              const SizedBox(height: 15),
              CustomRangePricesWidget(
                title: appLocalizations.monthlyPayments,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomOptionsWidget(
                  title: appLocalizations.estateType,
                  options: FilterScreenConstants.estateType,
                ),
              ),
              CustomOptionsWidget(
                title: appLocalizations.roomsNumber,
                options: FilterScreenConstants.roomsNumber.keys.toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomRangePricesWidget(
                  title: appLocalizations.priceWord,
                  hintText1: appLocalizations.lowestPrice,
                  hintText2: appLocalizations.highestPrice,
                ),
              ),
              CustomOptionsWidget(
                title: appLocalizations.paymentType,
                options: FilterScreenConstants.paymentType,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomOptionsWidget(
                  title: appLocalizations.estateStatus,
                  options: FilterScreenConstants.estateStatus,
                ),
              ),
              const SizedBox(height: 50,),
              FilledButton(
                onPressed: () {},
                child: Text(appLocalizations.showLotsOfResults),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
