import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_themes/font_manager.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 30.sp),
      ),
      child: AppText(
        text: text,
        fontSize: AppFontSize.s12.sp,
      ),
    );
  }
}
