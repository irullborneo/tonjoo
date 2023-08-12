import 'package:flutter/material.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';
import 'package:tonjoo/core/utils/tj_styles.dart';

class TjPasswordInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final bool showPrefixIcon, isPatternValidate, showLabel;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  const TjPasswordInput({
    Key? key,
    this.textInputAction,
    this.isPatternValidate = true,
    this.controller,
    this.label,
    this.showPrefixIcon = true,
    this.onChanged,
    this.showLabel = false,
    this.validator
  }) : super(key: key);

  @override
  State<TjPasswordInput> createState() => _TjPasswordInputState();
}

class _TjPasswordInputState extends State<TjPasswordInput> {
  bool _obscure = true;
  // late FieldValidator<dynamic> validate;

  @override
  void initState() {
    if (widget.isPatternValidate) {
      // validate = PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])',
      //     errorText: 'Password harus kombinasi huruf besar, kecil dan angka');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (widget.showLabel)
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 4, left: 4),
                  child: Text(
                    widget.label ?? "Password",

                  ),
                )
              : const SizedBox.shrink(),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: _obscure,
            onChanged: widget.onChanged,
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            style: const TextStyle(color: TjColors.neutral500),
            validator: widget.validator,
            decoration: InputDecoration(
                labelText: widget.label ?? "Password",
                counter: const Offstage(),
                filled: true,
                fillColor: TjColors.background,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                prefixIcon:
                    widget.showPrefixIcon ? const Icon(Icons.lock) : null,

                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                  icon:
                      Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                )),
          ),
        ],
      ),
    );
  }
}
