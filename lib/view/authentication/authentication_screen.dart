import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_theme/font_manager.dart';
import 'package:nzinga/default_settings/app_button/app_button.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AppText(
                text: 'Welcome to Nzinga',
                fontSize: AppFontSize.s24.sp,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: AppText(
                  text:'Nzinga is a photo uploading mobile application that automatically generates captions for your images.',
                  textAlign: TextAlign.center,
                  fontSize: AppFontSize.s12.sp,
                ),
              ),
              SizedBox(height: 20.sp),
              
              AppButton(
                text: 'Create Account',
                onPressed: () {},
              ),
              SizedBox(height: 10.sp),
              AppButton(
                text: 'Login',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}