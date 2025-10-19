import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';

class CustomOptionsWidget extends StatefulWidget {
  final String title;
  final String? startOption;
  final List<String> options;
  final Function(String value)? onSelectionChange;
  const CustomOptionsWidget({
    super.key,
    required this.title,
    this.onSelectionChange,
    this.startOption,
    required this.options,
  });

  @override
  State<CustomOptionsWidget> createState() => _CustomOptionsWidgetState();
}

class _CustomOptionsWidgetState
    extends BaseStatefulWidgetState<CustomOptionsWidget> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.startOption == null || widget.startOption!.isEmpty
        ? widget.options[0]
        : widget.startOption!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: theme.textTheme.labelLarge!.copyWith(
            color: AppColors.black.withAlpha(125),
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: widget.options.map((option) {
            return ChoiceChip(
              showCheckmark: false,
              labelPadding: const EdgeInsets.all(4),
              label: Text(option),
              selected: selectedOption == option,
              onSelected: (bool selected) {
                if (selectedOption == option) return;
                setState(() {
                  selectedOption = option;
                });
                widget.onSelectionChange?.call(option);
              },
              selectedColor: AppColors.blue.withAlpha(15),
              backgroundColor: AppColors.white,
              side: WidgetStateBorderSide.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return BorderSide(color: AppColors.blue, width: 2);
                } else {
                  return BorderSide(color: AppColors.black.withAlpha(25));
                }
              }),
              shape: option == appLocalizations.all
                  ? const CircleBorder()
                  : const RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.all(
                        Radius.circular(30),
                      ),
                    ),
              labelStyle: TextStyle(
                color: selectedOption == option
                    ? Colors.blue
                    : Colors.black.withAlpha(125),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
