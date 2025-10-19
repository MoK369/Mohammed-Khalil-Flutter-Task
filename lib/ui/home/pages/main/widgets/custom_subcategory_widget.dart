import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateless_widget.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';

class CustomSubcategoryWidget extends BaseStatelessWidget {
  final String imagePath;
  final String title;
  const CustomSubcategoryWidget({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context, db) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            spacing: 8,
            children: [
              Container(
                height: constraints.maxHeight / 1.5,
                decoration: BoxDecoration(
                  color: AppColors.black.withAlpha(25),
                  borderRadius: BorderRadiusGeometry.circular(5),
                ),
                child: Image.asset(imagePath),
              ),
              Text(
                title,
                style: db.theme.textTheme.titleMedium!.copyWith(
                  fontSize: constraints.maxHeight / 8,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
