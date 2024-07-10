import 'package:flutter/material.dart';
import 'package:nzinga/app_theme/font_manager.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign; // Optional parameter for text alignment

  const AppText({
    Key? key,
    required this.text,
    this.fontSize = AppFontSize.s12,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign, // Optional text alignment parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign, // Use the provided textAlign parameter
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
