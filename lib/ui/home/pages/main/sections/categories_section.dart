import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';

class CategoriesSection extends StatefulWidget implements PreferredSizeWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _CategoriesSectionState
    extends BaseStatefulWidgetState<CategoriesSection> {

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      onTap: (value) {

      },
      tabs: [

        Tab(child: Container(child: Text(appLocalizations.allOffers))),
      ],
    );
  }
}
