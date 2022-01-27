import 'package:flutter/material.dart';
import 'package:movie_app_api/src/configs/appColors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primaryColor2,
    ),
  );
}
