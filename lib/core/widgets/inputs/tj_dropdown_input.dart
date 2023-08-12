import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';

class TjDropdownInput<type> extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? initiateValue;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool showLabel;
  final String? Function(String?)? validator;
  final List<DropdownMenuItem<type>>? items;
  final type? selectedValue;
  final Function(type?)? onChanged;
  const TjDropdownInput({
    Key? key,
    this.controller,
    this.initiateValue,
    required this.label,
    this.prefixIcon,
    this.onChanged,
    this.textInputAction,
    this.textCapitalization,
    this.showLabel = false,
    this.validator,
    this.items,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (showLabel)
              ? Padding(
                  padding: EdgeInsets.only(bottom: 4.h, left: 4.w),
                  child: Text(
                    label,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                )
              : const SizedBox.shrink(),
          DropdownButtonHideUnderline(
            child: DropdownButton2<type>(
              isExpanded: true,
              hint: Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: items,
              value: selectedValue,
              onChanged: onChanged,
              buttonStyleData:  ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: 40.h,
                width: 140.w,
              ),
              menuItemStyleData:  MenuItemStyleData(
                height: 40.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
