import 'package:flutter/material.dart';
import 'package:nzinga/app_theme/font_manager.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const AppText({super.key, 
    required this.text,
    this.fontSize = AppFontSize.s12,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black, 
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

