import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/bases/base_stateless_widget.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/core/constants/assets_paths.dart';

class CustomProductCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;
  final String? discount;
  final String sold;
  const CustomProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    this.discount,
    required this.sold,
  });

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState
    extends BaseStatefulWidgetState<CustomProductCard> {
  ValueNotifier<bool> isFavorite = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.black.withAlpha(12), AppColors.white],
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
            stops: [0.6, 0.6],
          ),
          border: Border.all(color: AppColors.black.withAlpha(25), width: 1.3),
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Image.asset(widget.imagePath),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        ImageIcon(
                          const AssetImage(AssetsPaths.percentageIcon),
                          color: AppColors.red,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${widget.price}/",
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(color: AppColors.red),
                                  ),
                                  if (widget.discount != null)
                                    TextSpan(
                                      text: widget.discount,
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 12,
                                        color: AppColors.black.withAlpha(125),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: isFavorite,
                            builder: (context, value, child) {
                              return InkWell(
                                overlayColor: const WidgetStatePropertyAll(
                                  WidgetStateColor.transparent,
                                ),
                                onTap: () {
                                  isFavorite.value = !isFavorite.value;
                                },
                                child: Image.asset(
                                  value
                                      ? AssetsPaths.favoriteBlueIcon
                                      : AssetsPaths.favoriteIcon,

                                  width: 20,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ImageIcon(
                          AssetImage(AssetsPaths.fireIcon),
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            appLocalizations.sold(widget.sold),
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: AppColors.black.withAlpha(125),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Image.asset(AssetsPaths.companyBadgeIcon, width: 30),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.black.withAlpha(25),
                              width: 1.3,
                            ),
                            borderRadius: BorderRadiusGeometry.circular(5),
                          ),
                          child: Image.asset(
                            AssetsPaths.addToCartIcon,
                            width: 15,
                          ),
                        ),
                        Image.asset(AssetsPaths.tmgHoldingIcon, width: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
