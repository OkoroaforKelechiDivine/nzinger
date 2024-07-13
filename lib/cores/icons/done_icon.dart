import 'package:flutter/material.dart';

class DoneIcon extends StatelessWidget {
  final Color? color, iconColor;
  final double? size, padding;
  const DoneIcon({super.key, this.color, this.iconColor, this.size, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size,
        padding: EdgeInsets.all(padding ?? 3),
        decoration:BoxDecoration(color: color ?? Colors.green, shape: BoxShape.circle),
        child: Icon(
          Icons.done,
          size: size == null ? 12 : (size! / 2),
          color: iconColor ?? Colors.white,
        ));
  }
}