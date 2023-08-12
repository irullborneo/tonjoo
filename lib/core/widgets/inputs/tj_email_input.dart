import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';

class TjEmailInput extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? initiateValue;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool showLabel, readOnly;
  final String? Function(String?)? validator;
  const TjEmailInput(
      {Key? key,
      this.controller,
      this.initiateValue,
      required this.label,
      this.onChanged,
      this.textInputAction,
      this.textCapitalization,
      this.showLabel = false,
      this.readOnly = false,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (showLabel)
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 4, left: 4),
                  child: Text(
                    label,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                )
              : const SizedBox.shrink(),
          TextFormField(
            readOnly: readOnly,
            controller: controller,
            initialValue: initiateValue,
            validator: validator,
            onChanged: onChanged,
            keyboardType: TextInputType.emailAddress,
            textInputAction: textInputAction,
            style: const TextStyle(color: TjColors.neutral500),
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: const Icon(Icons.email),
              counter: const Offstage(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),

            ),
          ),
        ],
      ),
    );
  }
}
