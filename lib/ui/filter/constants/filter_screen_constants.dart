import 'package:otex_flutter_task/core/l10n/app_localizations.dart';

import '../../../core/di/di.dart';

abstract class FilterScreenConstants {
  static Map<String, String> get locations {
    final appLocalizations = getIt.get<AppLocalizations>();
    return {
      "eg": appLocalizations.egypt,
      "ksa": appLocalizations.saudiArabia,
      "uae": appLocalizations.emirates,
    };
  }

  static Map<String, int> get roomsNumber {
    final appLocalizations = getIt.get<AppLocalizations>();
    return {
      appLocalizations.fourRooms: 4,
      appLocalizations.fiveRoomsOrMore: 5,
      appLocalizations.all: -1,
      appLocalizations.twoRooms: 2,
      appLocalizations.treeRooms: 3,
    };
  }

  static List<String> get paymentType {
    final appLocalizations = getIt.get<AppLocalizations>();
    return [
      appLocalizations.any,
      appLocalizations.installment,
      appLocalizations.cash,
    ];
  }

  static List<String> get estateStatus {
    final appLocalizations = getIt.get<AppLocalizations>();
    return [
      appLocalizations.any,
      appLocalizations.ready,
      appLocalizations.underConstruction,
    ];
  }

  static List<String> get estateType {
    final appLocalizations = getIt.get<AppLocalizations>();
    return [
      appLocalizations.all,
      appLocalizations.townHouse,
      appLocalizations.separateVilla,
    ];
  }
}
