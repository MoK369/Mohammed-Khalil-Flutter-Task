import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/core/l10n/app_localizations.dart';

@module
abstract class AppLocalizationProvider {
  @preResolve
  Future<AppLocalizations> provide() {
    return AppLocalizations.delegate.load(const Locale('ar'));
  }
}
