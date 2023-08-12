import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';

class TjStyles {
  static TextStyle header = TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w700,
      color: TjColors.mainColor
  );

  static TextStyle title = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
  );

  static TextStyle subTitle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle caption = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle primaryButton = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: TjColors.neutral10
  );

  static TextStyle label = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: TjColors.neutral900
  );
}