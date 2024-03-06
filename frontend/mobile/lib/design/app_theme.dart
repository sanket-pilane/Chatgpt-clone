import 'package:flutter/material.dart';
import 'package:mobile/design/app_color.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.scaffoldBgColor,
        elevation: 0,
      ),
      scaffoldBackgroundColor: AppColor.scaffoldBgColor);
}
