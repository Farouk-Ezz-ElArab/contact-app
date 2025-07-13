import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final bool isEmail;
  final bool isPhone;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.text,
    required this.controller,
    this.isEmail = false,
    this.isPhone = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppTextStyles.textFormCardTextStyle,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : isPhone
          ? TextInputType.phone
          : TextInputType.text,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'All fields must be filled';
        }
        if (isEmail) {
          bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
          ).hasMatch(text);
          if (!emailValid) {
            return 'Please enter valid Email';
          }
        }
        if (isPhone) {
          String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
          RegExp regExp = RegExp(pattern);
          if (!regExp.hasMatch(text)) {
            return 'Please enter valid mobile number';
          }
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
        hintText: text,
        hintStyle: AppTextStyles.textFormTextStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
        enabled: true,
        focusColor: AppColors.gold,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}