import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String emptyImage;

  const EmptyWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.emptyImage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(emptyImage, height: 282, width: 282),
          SizedBox(height: 50),
          Text(
            title,
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          SizedBox(height: 12),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6C7278),
            ),
          ),
        ],
      ),
    );
  }
}
