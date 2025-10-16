import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateless_widget.dart';

class ChatsPage extends BaseStatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context, CommonDependency dp) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Chats Page", style: dp.theme.textTheme.titleLarge),
        ],
      ),
    );
  }
}
