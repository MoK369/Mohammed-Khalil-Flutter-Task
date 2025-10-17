import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';

class NavigationDestCustomIcon extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool showBottomBorder;
  final Color? iconColor;
  const NavigationDestCustomIcon({
    super.key,
    required this.iconPath,
    required this.label,
    this.iconColor,
    this.showBottomBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(5),
        border: Border(
          bottom: showBottomBorder
              ?  BorderSide(color: AppColors.black, width: 1.5)
              : BorderSide.none,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 2,
        children: [
          ImageIcon(AssetImage(iconPath), color: iconColor),
          Text(label,textAlign: TextAlign.center,style: const TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
