import 'package:flutter/material.dart';
import 'package:foodek_app/core/util/responsive.dart';

import '../../core/util/colors.dart';

class CustomGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final List<Color> colors;
  final Color textColor;

  CustomGradientButton({
    super.key,
    required this.text,
    required this.onTap,
    List<Color>? colors, // Nullable parameter
    this.textColor = Colors.white,
  }) : colors =
           colors ?? [AppColors.green, AppColors.dark_green]; // Initialize here

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: responsiveWidth(context, 307),
        height: responsiveHeight(context, 48),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(69),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: textColor, // Use the provided textColor
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
