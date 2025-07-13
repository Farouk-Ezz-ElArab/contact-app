import 'package:contact_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static  ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBlue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        backgroundColor: AppColors.gold,
        foregroundColor: AppColors.darkBlue,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,  
        ),
        //elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      )
    ),
  );
}