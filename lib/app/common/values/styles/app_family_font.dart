import 'package:flutter/material.dart';

class AppFamilyFont {

  String primaryFontFamily = 'Vito';
  static AppFamilyFont _singleton = AppFamilyFont._internal();
  
  AppFamilyFont._internal();
  
  factory AppFamilyFont() {
    return _singleton;
  }
  get textStyleLightFont => TextStyle(fontFamily: primaryFontFamily, fontWeight: FontWeight.w300);
  get textStyleRegularFont => TextStyle(fontFamily: primaryFontFamily, fontWeight: FontWeight.w400);
  get textStyleMediumFont => TextStyle(fontFamily: primaryFontFamily, fontWeight: FontWeight.w500);
  get textStyleBoldFont => TextStyle(fontFamily: primaryFontFamily, fontWeight: FontWeight.w700);

}