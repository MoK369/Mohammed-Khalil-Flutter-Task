import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateless_widget.dart';

class AddAdPage extends BaseStatelessWidget {
  const AddAdPage({super.key});

  @override
  Widget build(BuildContext context, dp) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Add an Ad Page", style: dp.theme.textTheme.titleLarge),
        ],
      ),
    );
  }
}
