import 'package:flutter/material.dart';
import 'package:foodek_app/core/util/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String dataName;
  final void Function()? onTap;
  final Color? colors;
  final Color? backgroundColor;
  final double height;
  final double width;
  final double radius;
  const ButtonWidget({
    super.key,
    required this.dataName,
    this.onTap,
    this.colors,
    this.backgroundColor,
    this.height = 50,
    this.width = double.infinity,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onTap,
        child: Text(dataName, style: TextStyle(fontSize: 16, color: colors)),
      ),
    );
  }
}
