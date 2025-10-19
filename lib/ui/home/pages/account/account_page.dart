import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateless_widget.dart';
import 'package:otex_flutter_task/core/routing/defined_routes.dart';

class AccountPage extends BaseStatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, dp) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Account Page", textAlign: TextAlign.center,style: dp.theme.textTheme.titleLarge),
          const SizedBox(height: 16,),
          FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, DefinedRoutes.plansScreen);
            },
            child: const Text("Plans Screen"),
          ),
        ],
      ),
    );
  }
}
