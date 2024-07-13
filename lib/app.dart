import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_themes/theme_manager.dart';
import 'package:nzinga/cores/locator/locator.dart';
import 'package:nzinga/views/auth/verify/verify.dart';
import 'package:nzinga/views/splash/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      // toastTheme: ToastThemeData(
      //   textColor: AppColors.black
      // ),
      child: ScreenUtilInit(
        builder: (context, child) {
          return GestureDetector(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: navigationService.navigatorKey,
              title: 'Nzinger',
              theme: getApplicationTheme(),
              home: const SplashScreen(),
              // routes: {
              //   '/verify': (context) => const VerifyScreen(),
              // },
            ),
          
          );
        },
      ),
    );
  }
}
