import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/core/constants/database_constants.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/core/database_result/database_result.dart';
import 'package:otex_flutter_task/core/di/di.dart';
import 'package:otex_flutter_task/core/l10n/app_localizations.dart';
import 'package:otex_flutter_task/data/models/estate_model.dart';
import 'package:otex_flutter_task/domain/repos_contracts/estates_repo/estates_repo.dart';
import 'package:otex_flutter_task/main.dart';
import 'package:otex_flutter_task/ui/filter/constants/filter_screen_constants.dart';
import 'package:otex_flutter_task/ui/filter/manager/filter_screen_state.dart';

@injectable
class FilterScreenViewModel extends Cubit<FilterScreenState> {
  final EstatesRepo _estatesRepo;
  FilterScreenViewModel(this._estatesRepo) : super(const FilterScreenState());

  ValueNotifier<String> selectedLocation = ValueNotifier(
    FilterScreenConstants.locations.values.first,
  );

  final PageController pageController = PageController(initialPage: 0);
  final TextEditingController lowestMonthlyPaymentsController =
      TextEditingController();
  final TextEditingController highestMonthlyPaymentsController =
      TextEditingController();
  final TextEditingController lowestPriceController = TextEditingController();
  final TextEditingController highestPriceController = TextEditingController();

  String selectedRoomsNumber = '';
  String selectedPaymentType = '';
  String selectedEstateStatus = '';
  String selectedEstateType = '';

  String where = '';
  List<String> whereArgs = [];

  void doIntent(FilterScreenIntent intent) {
    switch (intent) {
      case FilterEstatesIntent():
        _filterEstates();
        break;
      case OnClickingOnCloseButtonIntent():
        _whenClickingOnCloseButton();
        break;
    }
  }

  void _whenClickingOnCloseButton() {
    if (state.filterStatus == StatusEnum.success ||
        state.filterStatus == StatusEnum.error) {
      emit(
        state.copyWith(
          filterStatus: StatusEnum.idle,
          estatesResult: [],
          filterError: null,
        ),
      );
      pageController.jumpToPage(0);
    } else {
      navigatorKey.currentState!.pop();
    }
  }

  void _filterEstates() async {
    emit(state.copyWith(filterStatus: StatusEnum.loading));
    where = "";
    whereArgs = [];
    _getWhereAndWhereArgsForLocation();
    _getWhereAndWhereArgsForEstateType();
    _getWhereAndWhereArgsForEstateStatus();
    _getWhereAndWhereArgsForPaymentType();
    _getWhereAndWhereArgsForRoomsNumber();
    _getWhereAndWhereArgsForPrice();
    _getWhereAndWhereArgsForMonthlyPayments();

    debugPrint(where);
    debugPrint(whereArgs.toString());

    final repoResult = await _estatesRepo.select(
      where: where,
      whereArgs: whereArgs,
    );
    switch (repoResult) {
      case Success<List<EstateModel>>():
        emit(
          state.copyWith(
            filterStatus: StatusEnum.success,
            estatesResult: repoResult.data,
          ),
        );
        pageController.jumpToPage(1);
        break;
      case Error<List<EstateModel>>():
        emit(
          state.copyWith(
            filterStatus: StatusEnum.error,
            filterError: repoResult.error,
          ),
        );
        pageController.jumpToPage(1);

        break;
    }
  }

  void _getWhereAndWhereArgsForMonthlyPayments() {
    if (lowestMonthlyPaymentsController.text.isNotEmpty &&
        highestMonthlyPaymentsController.text.isNotEmpty) {
      _addToWhere(
        "${DatabaseConstants.estatesTableColumns[12]} BETWEEN ? AND ?",
      );
      whereArgs.addAll([
        lowestMonthlyPaymentsController.text,
        highestMonthlyPaymentsController.text,
      ]);
    } else if (lowestMonthlyPaymentsController.text.isNotEmpty) {
      _addToWhere("${DatabaseConstants.estatesTableColumns[12]} >= ?");
      whereArgs.add(lowestMonthlyPaymentsController.text);
    } else if (highestMonthlyPaymentsController.text.isNotEmpty) {
      _addToWhere("${DatabaseConstants.estatesTableColumns[12]} <= ?");
      whereArgs.add(highestMonthlyPaymentsController.text);
    }
  }

  void _getWhereAndWhereArgsForPrice() {
    if (lowestPriceController.text.isNotEmpty &&
        highestPriceController.text.isNotEmpty) {
      _addToWhere(
        "${DatabaseConstants.estatesTableColumns[3]} BETWEEN ? AND ?",
      );
      whereArgs.addAll([
        lowestPriceController.text,
        highestPriceController.text,
      ]);
    } else if (lowestPriceController.text.isNotEmpty) {
      _addToWhere("${DatabaseConstants.estatesTableColumns[3]} >= ?");
      whereArgs.add(lowestPriceController.text);
    } else if (highestPriceController.text.isNotEmpty) {
      _addToWhere("${DatabaseConstants.estatesTableColumns[3]} <= ?");
      whereArgs.add(highestPriceController.text);
    }
  }

  void _getWhereAndWhereArgsForRoomsNumber() {
    if (selectedRoomsNumber.isNotEmpty &&
        selectedRoomsNumber != getIt.get<AppLocalizations>().all) {
      FilterScreenConstants.roomsNumber[selectedRoomsNumber] == 5
          ? _addToWhere("${DatabaseConstants.estatesTableColumns[11]} >= ?")
          : _addToWhere("${DatabaseConstants.estatesTableColumns[11]} = ?");
      whereArgs.add(
        "${FilterScreenConstants.roomsNumber[selectedRoomsNumber]}",
      );
    }
  }

  void _getWhereAndWhereArgsForPaymentType() {
    if (selectedPaymentType.isNotEmpty &&
        selectedPaymentType != getIt.get<AppLocalizations>().any) {
      _addToWhere("${DatabaseConstants.estatesTableColumns[13]} = ?");
      whereArgs.add(selectedPaymentType);
    }
  }

  void _getWhereAndWhereArgsForEstateStatus() {
    if (selectedEstateStatus.isNotEmpty &&
        selectedEstateStatus != getIt.get<AppLocalizations>().any) {
      _addToWhere("${DatabaseConstants.estatesTableColumns[9]} = ?");
      whereArgs.add(selectedEstateStatus);
    }
  }

  void _getWhereAndWhereArgsForEstateType() {
    if (selectedEstateType.isNotEmpty &&
        selectedEstateType != getIt.get<AppLocalizations>().all) {
      _addToWhere("${DatabaseConstants.estatesTableColumns[10]} = ?");
      whereArgs.add(selectedEstateType);
    }
  }

  void _getWhereAndWhereArgsForLocation() {
    if (selectedLocation.value.isNotEmpty) {
      _addToWhere("${DatabaseConstants.estatesTableColumns[8]} = ?");
      whereArgs.add(selectedLocation.value);
    }
  }

  void _addToWhere(String value) {
    where = "${where.isEmpty ? "" : "$where AND "}$value";
  }
}

sealed class FilterScreenIntent {}

class FilterEstatesIntent extends FilterScreenIntent {}

class OnClickingOnCloseButtonIntent extends FilterScreenIntent {}
