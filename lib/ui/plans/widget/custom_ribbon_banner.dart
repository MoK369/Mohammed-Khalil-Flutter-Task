import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';

class CustomRibbonBanner extends StatefulWidget {
  final String title;
  const CustomRibbonBanner({super.key, required this.title});

  @override
  State<CustomRibbonBanner> createState() => _CustomRibbonBannerState();
}

class _CustomRibbonBannerState
    extends BaseStatefulWidgetState<CustomRibbonBanner> {

  final double trianglesWidth = 25;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.centerLeft,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.pink,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(8)),
          ),
          child: Text(
            widget.title,
            style: theme.textTheme.titleMedium!.copyWith(color: AppColors.red),
          ),
        ),
        Positioned(
          left: -trianglesWidth/2,
          top: 0,
          child: CustomPaint(
            painter: TrianglePainter(),
            size: Size(trianglesWidth, 25),
          ),
        ),
        Positioned(
          left: -trianglesWidth/2,
          bottom: 0,
          child: Transform.flip(
            flipY: true,
            child: CustomPaint(
              painter: TrianglePainter(),
              size: Size(trianglesWidth, 25),
            ),
          ),
        ),
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.pink
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0) // Top left
      ..lineTo(size.width / 2, 0) // Bottom left
      ..lineTo(size.width / 2, size.height) // Bottom right
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
