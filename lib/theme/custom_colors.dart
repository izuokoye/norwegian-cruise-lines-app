import 'package:flutter/material.dart';

class CustomColors {
  /// Primary colors (Blue)
  static const blue900 = Color(0xff0E1B43);
  static const blue800 = Color(0xff0D2770);
  static const blue700 = Color(0xff082D94);
  static const blue600 = Color(0xff0230B1);
  static const blue500 = Color(0xff0032C9);
  static const blue400 = Color(0xff3662DC);
  static const blue300 = Color(0xff6F92E9);
  static const blue200 = Color(0xffACC0F4);
  static const blue100 = Color(0xffE8EDFF);

  /// Secondary colors (Grey)
  static const grey900 = Color(0xff282F45);
  static const grey800 = Color(0xff282F45);
  static const grey700 = Color(0xff43495C);
  static const grey600 = Color(0xff6B6F7D);
  static const grey500 = Color(0xff9B9EA9);
  static const grey400 = Color(0xffC5C9D5);
  static const grey300 = Color(0xffCED9E8);
  static const grey200 = Color(0xffEDF2F7);
  static const grey100 = Color(0xffF9FBFE);

  /// Secondary colors (Peach)
  static const peach900 = Color(0xff6D171B);
  static const peach800 = Color(0xff933337);
  static const peach700 = Color(0xffB6585E);
  static const peach600 = Color(0xffDA898B);
  static const peach500 = Color(0xffFEBFC2);
  static const peach400 = Color(0xffFEBFC2);
  static const peach300 = Color(0xffFEE3F6);
  static const peach200 = Color(0xffFEEDF5);
  static const peach100 = Color(0xffFEF7F9);

  /// Secondary colors (Green)
  static const green900 = Color(0xff0A291A);
  static const green800 = Color(0xff117B47);
  static const green700 = Color(0xff08AD5E);
  static const green600 = Color(0xff05D16E);
  static const green500 = Color(0xff0CE87F);
  static const green400 = Color(0xff3CD88C);
  static const green300 = Color(0xff72E6AE);
  static const green200 = Color(0xffACF1D0);
  static const green100 = Color(0xffE5FDF2);

  /// Secondary colors (Purple)
  static const purple900 = Color(0xff4C1356);
  static const purple800 = Color(0xff6A2776);
  static const purple700 = Color(0xff894397);
  static const purple600 = Color(0xffA45EB1);
  static const purple500 = Color(0xffC07FCC);
  static const purple400 = Color(0xffDCA3E5);
  static const purple300 = Color(0xffE9C0F1);
  static const purple200 = Color(0xffF2D5F7);
  static const purple100 = Color(0xffF9EAFC);

  /// Secondary colors (Turquiose)
  static const turq900 = Color(0xff074549);
  static const turq800 = Color(0xff15777B);
  static const turq700 = Color(0xff2AA1A6);
  static const turq600 = Color(0xff43C3CA);
  static const turq500 = Color(0xff60E0E6);
  static const turq400 = Color(0xff81F1F5);
  static const turq300 = Color(0xffA6F6FA);
  static const turq200 = Color(0xffCFFCFD);
  static const turq100 = Color(0xffEDFCFD);
}

// this map object converts a HEX color
// code to a color that material color accepts
Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};

// this is the primarySwatch color used for the app theme
MaterialColor primarySwatch = MaterialColor(0xff217AAA, color);
