import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateless_widget.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/core/constants/assets_paths.dart';

class CustomProductCard extends BaseStatelessWidget {
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
  Widget build(BuildContext context, db) {
    return Center(
      child: Container(
        height: 300,
        width: 200,
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
                child: Image.asset(imagePath),
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
                            title,
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
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "$price/",
                            style: db.theme.textTheme.titleMedium!.copyWith(
                              color: AppColors.red,
                            ),
                          ),
                          if (discount != null)
                            TextSpan(
                              text: discount,
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 12,
                                color: AppColors.black.withAlpha(125),
                              ),
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
                            db.appLocalizations.sold(sold),
                            style: db.theme.textTheme.titleSmall!.copyWith(
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
