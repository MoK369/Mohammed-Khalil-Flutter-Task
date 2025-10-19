import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/core/constants/assets_paths.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/ui/filter/constants/filter_screen_constants.dart';
import 'package:otex_flutter_task/ui/filter/manager/filter_screen_state.dart';
import 'package:otex_flutter_task/ui/filter/manager/filter_screen_view_model.dart';
import 'package:otex_flutter_task/ui/filter/sections/location_section.dart';
import 'package:otex_flutter_task/ui/filter/widgets/custom_opitons_widget.dart';
import 'package:otex_flutter_task/ui/filter/widgets/custom_range_prices_widget.dart';

class FilteringPage extends StatefulWidget {
  const FilteringPage({super.key});

  @override
  State<FilteringPage> createState() => _FilteringPageState();
}

class _FilteringPageState extends BaseStatefulWidgetState<FilteringPage> {
  late FilterScreenViewModel filterScreenViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    filterScreenViewModel = BlocProvider.of<FilterScreenViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            leading: Image.asset(AssetsPaths.estateProviderIcon, width: 25),
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
            controller1: filterScreenViewModel.lowestMonthlyPaymentsController,
            controller2: filterScreenViewModel.highestMonthlyPaymentsController,
            title: appLocalizations.monthlyPayments,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomOptionsWidget(
              title: appLocalizations.estateType,
              startOption: filterScreenViewModel.selectedEstateType,
              options: FilterScreenConstants.estateType,
              onSelectionChange: (value) {
                filterScreenViewModel.selectedEstateType = value;
              },
            ),
          ),
          CustomOptionsWidget(
            title: appLocalizations.roomsNumber,
            startOption: filterScreenViewModel.selectedRoomsNumber,
            options: FilterScreenConstants.roomsNumber.keys.toList(),
            onSelectionChange: (value) {
              filterScreenViewModel.selectedRoomsNumber = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomRangePricesWidget(
              title: appLocalizations.priceWord,
              controller1: filterScreenViewModel.lowestPriceController,
              controller2: filterScreenViewModel.highestPriceController,
              hintText1: appLocalizations.lowestPrice,
              hintText2: appLocalizations.highestPrice,
            ),
          ),
          CustomOptionsWidget(
            title: appLocalizations.paymentType,
            startOption: filterScreenViewModel.selectedPaymentType,
            options: FilterScreenConstants.paymentType,
            onSelectionChange: (value) {
              filterScreenViewModel.selectedPaymentType = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomOptionsWidget(
              title: appLocalizations.estateStatus,
              startOption: filterScreenViewModel.selectedEstateStatus,
              options: FilterScreenConstants.estateStatus,
              onSelectionChange: (value) {
                filterScreenViewModel.selectedEstateStatus = value;
              },
            ),
          ),
          const SizedBox(height: 50),
          BlocBuilder<FilterScreenViewModel, FilterScreenState>(
            builder: (context, state) {
              return FilledButton(
                onPressed: () {
                  filterScreenViewModel.doIntent(FilterEstatesIntent());
                },
                child: state.filterStatus == StatusEnum.loading
                    ? const CircularProgressIndicator()
                    : Text(appLocalizations.showLotsOfResults),
              );
            },
          ),
        ],
      ),
    );
  }
}
