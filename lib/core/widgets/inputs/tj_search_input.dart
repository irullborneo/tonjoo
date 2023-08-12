import 'package:flutter/material.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';


class TjSearchInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? hints;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;

  const TjSearchInput({
    Key? key,
    this.onChanged,
    this.textInputAction,
    this.controller,
    this.hints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: TextInputType.name,
        textInputAction: textInputAction,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          hintText: hints ?? "Search",
          counter: const Offstage(),
          filled: true,
          fillColor: TjColors.neutral50,
          prefixIcon: const Icon(Icons.search),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
