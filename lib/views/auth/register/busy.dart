import 'package:flutter/material.dart';
import 'package:nzinga/app_themes/theme_manager.dart';

class CircularIndicator extends StatelessWidget {
  final bool show;

  const CircularIndicator({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: show ? 0.4 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: Stack(
        children: [
          if (show)
            Container(
              color: Colors.black,
            ),
          Center(
            child: CircularProgressIndicator(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
