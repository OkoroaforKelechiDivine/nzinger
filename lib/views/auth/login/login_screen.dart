import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_themes/font_manager.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';
import 'package:nzinga/default_settings/app_text_field/app_text_field.dart';
import 'package:nzinga/views/auth/widget/auth_text_buttons.dart';
import 'package:nzinga/view_models/auth/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: AppText(
              text: 'Welcome back',
              fontSize: AppFontSize.s24.sp,
            ),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50.sp),
                  AppTextField(
                    controller: model.email,
                    labelText: 'Email',
                  ),
                  SizedBox(height: 10.sp),
                  AppTextField(
                    labelText: 'Password',
                    controller: model.password,
                    obscureText: true,
                  ),
                  SizedBox(height: 20.sp),
                  AuthTextButtons(
                    backToLoginText: "Login",
                    onBackToLoginPressed: model.signin,
                  ),
                  SizedBox(height: 20.sp),
                  // SignInWithOptions(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
