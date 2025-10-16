import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends BaseStatefulWidgetState<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Account Page", style: theme.textTheme.titleLarge)],
      ),
    );
  }
}
