import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateless_widget.dart';

class MyAdsPage extends BaseStatelessWidget {
  const MyAdsPage({super.key});

  @override
  Widget build(BuildContext context, dp) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("My Ads Page", style: dp.theme.textTheme.titleLarge),
        ],
      ),
    );
  }
}
