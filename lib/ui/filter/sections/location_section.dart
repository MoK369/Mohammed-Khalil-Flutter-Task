import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/ui/filter/constants/filter_screen_constants.dart';
import 'package:otex_flutter_task/ui/filter/manager/filter_screen_view_model.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({super.key});

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends BaseStatefulWidgetState<LocationSection> {

  late FilterScreenViewModel filterScreenViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    filterScreenViewModel = BlocProvider.of<FilterScreenViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: AppColors.black.withAlpha(25)),
        PopupMenuButton<String>(
          onSelected: (value) {
            // Handle selection
            filterScreenViewModel.selectedLocation.value = FilterScreenConstants.locations[value]!;
          },
          itemBuilder: (BuildContext context) {
            final keys = FilterScreenConstants.locations.keys.toList();
            return List.generate(keys.length, (index) {
              return PopupMenuItem(
                value: keys[index],
                child: Text(FilterScreenConstants.locations[keys[index]]!),
              );
            });
          },
          child: ListTile(
            leading: const Icon(Icons.location_on_outlined),
            contentPadding: const EdgeInsets.only(right: 8),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appLocalizations.location),
                ValueListenableBuilder(
                  valueListenable: filterScreenViewModel.selectedLocation,
                  builder: (context, value, child) {
                    return Text(value, style: theme.textTheme.titleSmall);
                  },
                ),
              ],
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
              weight: 50,
            ),
          ),
        ),
        Divider(color: AppColors.black.withAlpha(25)),
      ],
    );
  }
}
