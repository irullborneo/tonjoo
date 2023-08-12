import 'package:flutter/material.dart';

abstract class TjColors {
  TjColors._();

  static const Color mainColor = Colors.deepOrange;
  static const Color background = Colors.white;
  static const Color confirmed = Color(0xffFF7C32);
  static const Color confirmedSurface = Color(0xfffce4d7);
  static const Color dangerSurface = Color(0xffFFF4F2);
  static const Color dangerMain = Color(0xffCB3A31);
  static const Color successMain = Color(0xff43936C);
  static const Color successPressed = Color(0xff20573D);
  static const Color successSurface = Color(0xffF7F7F7);
  static const Color infoSurface = Color(0xffF0F3FF);
  static const Color infoMain = Color(0xff3267E3);

  static const Color neutral10 = Color(0xffFFFFFF);
  static const Color neutral20 = Color(0xffF5F5F5);
  static const Color neutral30 = Color(0xffEFEFEF);
  static const Color neutral40 = Color(0xffEDEDED);
  static const Color neutral50 = Color(0xffC2C2C2);
  static const Color neutral60 = Color(0xff9E9E9E);
  static const Color neutral70 = Color(0xff757575);
  static const Color neutral80 = Color(0xff616161);
  static const Color neutral90 = Color(0xff404040);

  static const Color neutral100 = Color(0xffF5F5F5);
  static const Color neutral400 = Color(0xffA3A3A3);
  static const Color neutral500 = Color(0xff737373);
  static const Color neutral150 = Color(0xffEAEAEF);
  static const Color neutral200 = Color(0xffDCDCE4);
  static const Color neutral600 = Color(0xff525252);
  static const Color neutral900 = Color(0xff171717);
  static const MaterialColor neutral =
  MaterialColor(0xffF5F5F5, <int, Color>{
    10: Color(0x0DF5F5F5),
    50: Color(0x26F5F5F5),
    100: Color(0x40F5F5F5),
    200: Color(0x59F5F5F5),
    300: Color(0x73F5F5F5),
    400: Color(0x8CF5F5F5),
    500: Color(0xA6F5F5F5),
    600: Color(0xBFF5F5F5),
    700: Color(0xD9F5F5F5),
    800: Color(0xF2F5F5F5),
    900: Color(0xFFF5F5F5),
  });
}