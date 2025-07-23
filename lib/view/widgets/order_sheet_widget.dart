import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import 'bottom_widget.dart';
import 'custom_text.dart';

class OrderSheetWidget extends StatelessWidget {
  final BuildContext context;
  final void Function()? onTap;
  final double padding;
  const OrderSheetWidget({
    super.key,
    required this.context,
    this.onTap,
    this.padding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, padding),
      ),
      child: Stack(
        children: [
          Container(
            height: responsiveHeight(context, 206),
            width: responsiveWidth(context, 387),
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: responsiveHeight(context, 12),
                top: responsiveHeight(context, 12),
                left: responsiveWidth(context, 12),
                right: responsiveWidth(context, 12),
              ),
              child: Column(
                children: [
                  buildOrderDetails(title: tr("sub_total"), price: "100"),
                  buildOrderDetails(title: tr("sub_total"), price: "100"),
                  buildOrderDetails(title: tr("sub_total"), price: "100"),
                  buildOrderDetails(
                    title: tr("sub_total"),
                    price: "100",
                    isBold: true,
                    size: 18,
                  ),
                  SizedBox(height: responsiveHeight(context, 10)),
                  ButtonWidget(
                    dataName: tr("place_my_order"),
                    onTap: onTap,
                    colors: AppColors.green,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Image.asset('assets/images/order_pattern.png'),
        ],
      ),
    );
  }

  Widget buildOrderDetails({
    required String title,
    required String price,
    double size = 14,
    bool isBold = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsiveHeight(context, 3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            size: size,
            color: Colors.white,
            weight: isBold ? FontWeight.bold : FontWeight.w400,
          ),
          CustomText(
            text: "$price \$",
            size: size,
            color: Colors.white,
            weight: isBold ? FontWeight.bold : FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
