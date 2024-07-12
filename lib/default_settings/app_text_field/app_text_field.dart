import 'package:flutter/material.dart';
import 'package:nzinga/app_theme/font_manager.dart';
import 'package:nzinga/app_theme/theme_manager.dart';

class AppTextField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;

  const AppTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.black,
          ),
        ),
        labelStyle: TextStyle(color: AppColors.black),
        floatingLabelStyle: TextStyle(color: AppColors.black),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.black,
                  size: AppFontSize.s18,
                ),
                onPressed: _toggleObscureText,
              )
            : null,
      ),
      obscureText: _obscureText,
    );
  }
}
