import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/l10n/app_localizations.dart';

abstract class BaseStatefulWidgetState<T extends StatefulWidget>
    extends State<T> {
  late AppLocalizations appLocalizations;
  late ThemeData theme;

  @mustCallSuper
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
    theme = Theme.of(context);
  }
}
