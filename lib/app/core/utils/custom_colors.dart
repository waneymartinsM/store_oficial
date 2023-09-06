import 'package:flutter/material.dart';

abstract class CustomColors {
  static const mainBlue = Color(0xFF044C6C);
  static const mainBlueLight = Color(0xFFE5EDF0);
  static const darkBlue = Color(0xFF02354b);
  static const mainGolden = Color(0xFFA8863F);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFFAAAAAA);
  static const lightGrey = Color(0XFFF5F5F5);
  static const greySubtitle = Color(0XFF888888);
  static const greyStar = Color(0XFFBBBBBB);
  static const greyDivider = Color(0XFFEEEEEE);
  static const divider = Color(0XFFDDDDDD);
  static const mainBlueGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomRight,
      colors: [darkBlue, mainBlue]);

  static const Color pumpkin = Color(0XFFF97103);
  static const Color cadmiumOrange = Color(0XFFF98B32);
  static const Color jet = Color(0XFF3D3B39);
  static const Color pureWhite = Color(0XFFF8F8F8);
  static const Color pureRed = Color(0XFFFE4140);
}
