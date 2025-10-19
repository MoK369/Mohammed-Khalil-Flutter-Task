import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/ui/plans/manager/plans_screen_view_model.dart';
import 'package:otex_flutter_task/ui/plans/widget/custom_ribbon_banner.dart';

class CustomPlanCard extends StatefulWidget {
  final String planTitle;
  final String planPrice;
  final List<String> features;

  final int? viewsNumber;
  final String? ribbonTitle;
  const CustomPlanCard({
    super.key,
    required this.features,
    required this.planTitle,
    required this.planPrice,
    this.ribbonTitle,
    this.viewsNumber,
  });

  @override
  State<CustomPlanCard> createState() => _CustomPlanCardState();
}

class _CustomPlanCardState extends BaseStatefulWidgetState<CustomPlanCard> {
  ValueNotifier<bool> isSelected = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isSelected,
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            Checkbox(
                              value: value,
                              onChanged: (value) {
                                isSelected.value = !isSelected.value;
                              },
                            ),
                            Text(
                              widget.planTitle,
                              style: theme.textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: value ? AppColors.blue : AppColors.black,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IntrinsicWidth(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Text(
                                widget.planPrice,
                                style: theme.textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Container(
                                color: AppColors.red,
                                height: 2.5,
                                margin: const EdgeInsets.only(
                                  bottom: 2,
                                  left: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicWidth(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Text(
                                appLocalizations.planPrice,
                                style: theme.textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Container(
                                color: AppColors.red,
                                height: 2.5,
                                margin: const EdgeInsets.only(
                                  bottom: 2,
                                  left: 5,
                                  right: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: AppColors.black.withAlpha(20)),
                Row(
                  mainAxisAlignment: widget.viewsNumber != null
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.features.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: ImageIcon(
                              AssetImage(
                                PlansScreenViewModel.getIconForFeature(
                                  widget.features[index],
                                ),
                              ),
                            ),
                            horizontalTitleGap: 8,
                            title: Text(widget.features[index]),
                          );
                        },
                      ),
                    ),
                    if (widget.viewsNumber != null)
                      Column(
                        children: [
                          Container(
                            width: 90,
                            height: 50,
                            padding: const EdgeInsets.only(top: 16),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.green.withAlpha(12),
                              border: Border(
                                top: BorderSide(
                                  width: 2.2,
                                  color: AppColors.green,
                                ),
                                left: BorderSide(
                                  width: 2.2,
                                  color: AppColors.green,
                                ),
                                right: BorderSide(
                                  width: 2.2,
                                  color: AppColors.green,
                                ),
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            child: Text(
                              widget.viewsNumber.toString(),
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: AppColors.green,
                              ),
                            ),
                          ),
                          Text(
                            appLocalizations.doubleNumberOfView,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (widget.ribbonTitle != null)
          Positioned(
            top: -22,
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: CustomRibbonBanner(title: widget.ribbonTitle!),
            ),
          ),
      ],
    );
  }
}
