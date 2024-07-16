import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_themes/font_manager.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';

class AuthTextButtons extends StatelessWidget {
  final VoidCallback? onRegisterPressed;
  final VoidCallback? onBackToLoginPressed;
  final String? registerText;
  final String? backToLoginText;

  const AuthTextButtons({
    super.key,
    this.onRegisterPressed,
    this.onBackToLoginPressed,
    this.registerText,
    this.backToLoginText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onRegisterPressed ?? () {},
          child: AppText(
            text: registerText ?? '',
            // fontWeight: AppFontWeight.bold,
            fontSize: AppFontSize.s12.sp,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onBackToLoginPressed ?? () {},
          child: AppText(
            text: backToLoginText ?? '',
            fontSize: AppFontSize.s12.sp,
          ),
        ),
      ],
    );
  }
}
