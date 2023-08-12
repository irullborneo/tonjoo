import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';
import 'package:tonjoo/core/utils/tj_styles.dart';

class TjTheme {
  static ThemeData get light {
    return ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme().apply(
            bodyColor: TjColors.neutral90
        ),
        iconTheme: const IconThemeData(
            color: TjColors.neutral90
        ),
        primaryColor: TjColors.mainColor,
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: TjColors.mainColor,
            iconTheme: IconThemeData(color: TjColors.neutral900),
            actionsIconTheme: IconThemeData(color: TjColors.neutral900),
            elevation: 0,
            )
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorColor = TjColors.mainColor
    ..textColor = TjColors.neutral90
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..maskType = EasyLoadingMaskType.custom
    ..backgroundColor = TjColors.neutral10
    ..maskColor = TjColors.neutral90.withOpacity(0.5);
}