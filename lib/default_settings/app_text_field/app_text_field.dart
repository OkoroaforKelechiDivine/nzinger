import 'package:flutter/material.dart';
import 'package:nzinga/app_theme/theme_manager.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;

  const AppTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.black,
          ),
        ),
        labelStyle: TextStyle(color: AppColors.black),
        floatingLabelStyle: TextStyle(color: AppColors.black),
      ),
      obscureText: obscureText,
    );
  }
}
