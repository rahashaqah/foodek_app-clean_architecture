import 'package:flutter/material.dart';
import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import 'custom_text.dart';

class HistoryItemWidget extends StatelessWidget {
  final String path;
  final String title;
  final String description;
  final double price;
  final String date;

  const HistoryItemWidget({
    super.key,
    required this.path,
    required this.title,
    required this.description,
    required this.price,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 20),
        vertical: responsiveHeight(context, 10),
      ),
      child: Container(
        height: responsiveHeight(context, 103),
        width: responsiveWidth(context, 388),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.light_green),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.asset(
                  path,
                  width: responsiveWidth(context, 62),
                  height: responsiveHeight(context, 62),
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: responsiveWidth(context, 10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: title, size: 15, weight: FontWeight.w500),
                  CustomText(
                    text: description,
                    size: 12,
                    weight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                  CustomText(
                    text: '\$ $price',
                    size: 19,
                    weight: FontWeight.w700,
                    color: AppColors.green,
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: AppColors.green,
                        size: 15,
                      ),
                      SizedBox(width: 4),
                      CustomText(
                        text: date,
                        color: AppColors.grey,
                        size: 12,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context, 13)),
                  Row(
                    children: [
                      Icon(Icons.loop, color: AppColors.green, size: 15),
                      SizedBox(width: 4),
                      CustomText(
                        text: "Reorder",
                        color: AppColors.green,
                        size: 12,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
