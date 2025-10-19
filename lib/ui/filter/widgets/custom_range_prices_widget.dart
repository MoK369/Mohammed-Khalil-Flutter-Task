import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otex_flutter_task/core/bases/base_stateless_widget.dart';

class CustomRangePricesWidget extends BaseStatelessWidget {
  final String title;
  final TextEditingController? controller1;
  final TextEditingController? controller2;
  final String? hintText1, hintText2;
  const CustomRangePricesWidget({
    super.key,
    required this.title,
    this.controller1,
    this.controller2,
    this.hintText1,
    this.hintText2,
  });

  @override
  Widget build(BuildContext context, dp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: dp.theme.textTheme.titleMedium!.copyWith(
            color: Colors.black.withAlpha(125),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomPriceTextFormField(
                controller: controller1,
                hintText: hintText1,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomPriceTextFormField(
                controller: controller2,
                hintText: hintText2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomPriceTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  const CustomPriceTextFormField({super.key, this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
