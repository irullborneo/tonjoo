import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';

class TjCardShadow extends StatelessWidget {
  final Widget body;
  final EdgeInsetsGeometry? padding;
  const TjCardShadow({Key? key, required this.body, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(20.w),
      decoration: BoxDecoration(
          color: TjColors.background,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 2),
              spreadRadius: -3,
              blurRadius: 12,
              color: Color.fromRGBO(0, 0, 0, 0.3),
            )
          ]),
      child: body,
    );
  }
}
