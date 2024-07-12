import 'package:flutter/material.dart';

class AppColors {
  static Color white = Colors.white;
  static Color black = Color.fromRGBO(0, 0, 0, 1);
  static Color green = HexColor.fromHex('#3DB86E');
  static Color lightGreen = HexColor.fromHex('#90EE90');
  static Color red = HexColor.fromHex('#FF0000');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

ThemeData _appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.white, elevation: 0),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.green,
      )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(500, 50),
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black
  ,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          color: AppColors.black
      ,
        ),
      ),
    ),
  ),
  primarySwatch: Colors.grey,
);

getApplicationTheme() {
  return _appTheme;
}
