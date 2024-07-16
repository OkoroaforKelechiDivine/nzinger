import 'package:flutter/material.dart';
import 'package:nzinga/app_themes/font_manager.dart';
import 'package:nzinga/app_themes/theme_manager.dart';

class AppTextField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final double fontSize;

  const AppTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    required this.controller,
    this.fontSize = AppFontSize.s16, // Default font size
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
      style: TextStyle(fontSize: widget.fontSize),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: AppColors.black, fontSize: widget.fontSize),
        floatingLabelStyle: TextStyle(color: AppColors.black, fontSize: widget.fontSize),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.black,
          ),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.black,
                  size: AppFontSize.s12,
                ),
                onPressed: _toggleObscureText,
              )
            : null,
      ),
      obscureText: _obscureText,
    );
  }
}