import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otex_flutter_task/ui/filter/constants/filter_screen_constants.dart';
import 'package:otex_flutter_task/ui/filter/manager/filter_screen_state.dart';

@injectable
class FilterScreenViewModel extends Cubit<FilterScreenState> {
  FilterScreenViewModel() : super(FilterScreenState());

  ValueNotifier<String> selectedLocation = ValueNotifier(
    FilterScreenConstants.locations.values.first,
  );
}
