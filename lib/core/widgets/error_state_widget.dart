import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateless_widget.dart';

class ErrorStateWidget extends BaseStatelessWidget {
  final Object error;
  const ErrorStateWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context, dp) {
    return Text(
      error.toString(),
      textAlign: TextAlign.center,
      style: dp.theme.textTheme.titleLarge,
    );
  }
}
