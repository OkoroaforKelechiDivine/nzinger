import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_theme/font_manager.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';
import 'package:nzinga/default_settings/constants/app_assets.dart';

class SignInWithOptions extends StatelessWidget {
  const SignInWithOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          text: 'Or sign in with',
          fontSize: AppFontSize.s12.sp,
        ),
        SizedBox(height: 10.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset(
                AppAssets.googleLogo,
                height: 30.sp,
                width: 30.sp,
                fit: BoxFit.cover,
              ),
              iconSize: 30.sp,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}