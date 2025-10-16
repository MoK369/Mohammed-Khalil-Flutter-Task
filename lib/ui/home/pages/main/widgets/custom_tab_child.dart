import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateless_widget.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';

class CustomTabChild extends BaseStatelessWidget {
  final String title;
  final bool isSelected;
  const CustomTabChild({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context, CommonDependency db) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black.withAlpha(25), width: 1.3),
        borderRadius: BorderRadiusGeometry.circular(5),

      ),
      child: Text(title),
    );
  }
}
