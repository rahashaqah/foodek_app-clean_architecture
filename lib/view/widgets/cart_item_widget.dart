import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodek_app/view/widgets/quantity_widget.dart';

import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import 'custom_text.dart';

class CartItemWidget extends StatefulWidget {
  final String path;
  final String title;
  final String description;
  final double price;
  final VoidCallback onDismissed;

  const CartItemWidget({
    super.key,
    required this.path,
    required this.title,
    required this.description,
    required this.price,
    required this.onDismissed,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 20),
        vertical: responsiveHeight(context, 10),
      ),
      child: Dismissible(
        key: Key(widget.title),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 10),
            ),
            child: SvgPicture.asset(
              'assets/icons/trash.svg',
              height: responsiveHeight(context, 25),
              width: responsiveWidth(context, 25),
            ),
          ),
        ),
        onDismissed: (direction) {
          widget.onDismissed();
        },
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
                    widget.path,
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
                    CustomText(
                      text: widget.title,
                      size: 15,
                      weight: FontWeight.w500,
                    ),
                    CustomText(
                      text: widget.description,
                      size: 12,
                      weight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                    CustomText(
                      text: '\$ ${widget.price}',
                      size: 19,
                      weight: FontWeight.w700,
                      color: AppColors.green,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QuantityWidget(
                      fullWidth: 130,
                      textSize: 16,
                      squareSize: 26,
                      squareRadius: 8,
                      subtractColor: AppColors.light_green,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
