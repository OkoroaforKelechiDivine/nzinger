import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_theme/font_manager.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';

class AuthTextButtons extends StatelessWidget {
  final VoidCallback onRegisterPressed;
  final VoidCallback onBackToLoginPressed;

  const AuthTextButtons({
    super.key,
    required this.onRegisterPressed,
    required this.onBackToLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onRegisterPressed,
          child: AppText(
            text: 'Register',
            fontWeight: AppFontWeight.bold,
            fontSize: AppFontSize.s12.sp,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onBackToLoginPressed,
          child: AppText(
            text: '< Back to Login',
            fontSize: AppFontSize.s12.sp,
          ),
        ),
      ],
    );
  }
}