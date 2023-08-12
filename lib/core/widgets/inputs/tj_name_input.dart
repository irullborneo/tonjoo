import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';

class TjNameInput extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? initiateValue;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool showLabel;
  final String? Function(String?)? validator;
  const TjNameInput(
      {Key? key,
        this.controller,
        this.initiateValue,
        required this.label,
        this.prefixIcon,
        this.onChanged,
        this.textInputAction,
        this.textCapitalization,
        this.showLabel = false,
        this.validator
        })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (showLabel) ? Padding(
            padding: EdgeInsets.only(bottom: 4.h,left: 4.w),
            child: Text(label, style: Theme.of(context).textTheme.labelLarge!.copyWith(fontStyle: FontStyle.italic),),
          ) : const SizedBox.shrink(),
          TextFormField(
            controller: controller,
            initialValue: initiateValue,
            onChanged: onChanged,
            validator: validator,
            keyboardType: TextInputType.text,
            textInputAction: textInputAction,
            style: const TextStyle(color: TjColors.neutral500),
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: prefixIcon,
              counter: const Offstage(),
              filled: true,
              fillColor: TjColors.background,
              contentPadding:
              EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),

            ),
          ),
        ],
      ),
    );
  }
}
