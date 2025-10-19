import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/l10n/app_localizations.dart';

abstract class BaseStatelessWidget extends StatefulWidget {
  const BaseStatelessWidget({super.key});

  Widget build(BuildContext context, CommonDependency dependency);

  @override
  State<BaseStatelessWidget> createState() => _BaseStatelessWidgetState();
}

class _BaseStatelessWidgetState extends State<BaseStatelessWidget> {
  late CommonDependency dependency;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dependency = CommonDependency(
      AppLocalizations.of(context)!,
      Theme.of(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, dependency);
  }
}

class CommonDependency {
  AppLocalizations appLocalizations;
  ThemeData theme;
  CommonDependency(this.appLocalizations, this.theme);
}
