import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';
import 'package:tonjoo/core/utils/tj_styles.dart';

class TjButtonPrimary extends StatelessWidget {
  final double? width, height;
  final String label;
  final Function()? onPressed;
  final IconData? icon;
  const TjButtonPrimary(
      {Key? key,
        required this.label,
        this.onPressed,
        this.height,
        this.width,
        this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: TjColors.mainColor,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r)),
            ),
            label: Text(label, style: TjStyles.primaryButton)),
      );
    }
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: onPressed == null
                  ? TjColors.neutral
                  : TjColors.mainColor),
          borderRadius: BorderRadius.circular(5.r)),
      elevation: 0,
      minWidth: width??double.infinity,
      height: height,
      color: TjColors.mainColor,
      disabledColor: TjColors.neutral150,
      splashColor: TjColors.mainColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Text(
          label,
          style: TjStyles.primaryButton
              .copyWith(color: onPressed == null ? TjColors.neutral60 : null),
        ),
      ),
    );
  }
}
