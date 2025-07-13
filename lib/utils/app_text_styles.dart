import 'package:flutter/material.dart';

import 'package:contact_app/utils/app_colors.dart';

class AppTextStyles{
  static final TextStyle cardContentTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: AppColors.darkBlue,
  );

  static TextStyle cardUserNameTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.darkBlue,
  );

  static TextStyle textFormTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.lightBlue,
  );

  static TextStyle textFormCardTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.gold,
  );
  static TextStyle firstMainTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.gold,
  );

  static TextStyle deleteClickTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: AppColors.white,
  );
}