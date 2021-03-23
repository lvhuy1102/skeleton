import 'dart:ui';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppStyles {
  AppStyles._();

  static const fontSFPro = "SFPro";

  static final boxShadow = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
      boxShadow: [BoxShadow(blurRadius: 6, offset: Offset(0, 3), color: Color.fromRGBO(0, 0, 0, .16))]);

  static const textTheme = TextTheme(
      bodyText1: const TextStyle(fontFamily: AppStyles.fontSFPro, fontSize: 14, color: AppColors.textDefault),
      bodyText2: const TextStyle(fontFamily: AppStyles.fontSFPro, fontSize: 12, color: AppColors.textDefault),
      caption: const TextStyle(fontFamily: AppStyles.fontSFPro, fontSize: 10, color: AppColors.lightGrey),
      headline6: const TextStyle(fontFamily: AppStyles.fontSFPro, fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark),
      headline5: const TextStyle(fontFamily: AppStyles.fontSFPro, fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark),
      headline4: const TextStyle(fontFamily: AppStyles.fontSFPro, fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark),
      headline3: const TextStyle(fontFamily: AppStyles.fontSFPro, fontSize: 26, fontWeight: FontWeight.bold),
      headline2: const TextStyle(fontFamily: AppStyles.fontSFPro, fontSize: 30, fontWeight: FontWeight.w900));
}
