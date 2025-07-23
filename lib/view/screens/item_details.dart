import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodek_app/core/util/colors.dart';
import 'package:foodek_app/core/util/responsive.dart';
import 'package:foodek_app/view/widgets/appbar_widget.dart';
import 'package:foodek_app/view/widgets/quantity_widget.dart';
import 'package:foodek_app/view/widgets/search_widget.dart';
import 'package:foodek_app/view/widgets/spicy_slider_widget.dart';

import '../navigation_bar.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/custom_text.dart';
import '../widgets/star_rating_widget.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: responsiveHeight(context, 22)),
                SearchBarWidget(),
                SizedBox(height: responsiveHeight(context, 22)),
                Image.asset("assets/images/cheese-burger.png"),
                SizedBox(height: 24),
                Text(
                  "Cheeseburger Wendy's Burger",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 8)),
                Row(
                  children: [
                    StarRatingWidget(rating: 4.5),
                    SizedBox(width: 8),
                    CustomText(
                      text: "4.5 (89 reviews)",
                      color: AppColors.grey,
                      weight: FontWeight.w400,
                      size: 12,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "\$7.99",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF25AE4B),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "\$9.5",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  "Nulla occaecat velit laborums exercitation ullamco. Elit labore eu\ aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est\ cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis\ eu laborum. ",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 24)),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SpicySlider(),
                SizedBox(width: responsiveWidth(context, 40)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomText(
                        text: tr("quantity"),
                        color: AppColors.dark_grey,
                        size: 12,
                        weight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 20)),
                    QuantityWidget(),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 50),
              vertical: responsiveHeight(context, 39),
            ),
            child: ButtonWidget(
              dataName: tr("add_to_cart"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationBarScreen(),
                  ),
                );
              },
              colors: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
