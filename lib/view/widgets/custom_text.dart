import 'package:flutter/material.dart';
import 'package:foodek_app/core/util/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? alignment;
  final bool isUnderlined;

  const CustomText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.alignment = TextAlign.center,
    this.isUnderlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.center,
      style: TextStyle(
        decoration: isUnderlined ? TextDecoration.underline : null,
        fontSize: size ?? 20,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.w500,
      ),
    );
  }
}
