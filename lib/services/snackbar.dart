import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_themes/font_manager.dart';
import 'package:nzinga/app_themes/theme_manager.dart';
import 'package:nzinga/cores/icons/done_icon.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';
import 'package:overlay_support/overlay_support.dart';

class SnackbarService {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void error({
    required String message,
    int milliseconds = 5000,
  }) {
    showOverlayNotification(
      (context) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Material(
              elevation: 8,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    stops: [0.02, 0.02],
                    colors: [Colors.red, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: AppColors.red,
                      size: 32,
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: AppText(
                        text: message,
                        fontSize: AppFontSize.s12.sp,
                        color: AppColors.red
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      duration: Duration(milliseconds: milliseconds),
    );
  }

  void success({
    required String message,
    int milliseconds = 5000,
  }) {
    showOverlayNotification(
      (context) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Material(
              elevation: 8,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    stops: const [0.02, 0.02],
                    colors: [AppColors.lightGreen, Colors.white],
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DoneIcon(
                      size: 36,
                      color: AppColors.lightGreen,
                      iconColor: Colors.white,
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: AppText(
                        text: message,
                        fontSize: AppFontSize.s12.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      duration: Duration(milliseconds: milliseconds),
    );
  }
}
