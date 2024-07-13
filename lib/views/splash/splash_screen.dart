import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_themes/font_manager.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';
import 'package:nzinga/view_models/splash/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) {
        viewModel.initializeSplashScreen();
      },
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: Center(
            child: AppText(
              text: 'Nzinga',
              fontSize: AppFontSize.s38.sp,
              fontWeight: AppFontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
