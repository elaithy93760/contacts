import 'package:contact/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}