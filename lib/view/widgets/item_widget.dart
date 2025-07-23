import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import '../screens/item_details.dart';
import 'custom_text.dart';

class ItemWidget extends StatelessWidget {
  final String path;
  final String name;
  final String description;
  final String price;

  const ItemWidget({
    super.key,
    required this.path,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 6),
        // vertical: responsiveHeight(context, 11),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Container(
              height: responsiveHeight(context, 200),
              width: responsiveWidth(context, 172),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.light_green),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: responsiveHeight(context, 89),
                    width: responsiveWidth(context, 89),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        center: Alignment.center,
                        radius: 0.8,
                        colors: [Color(0xffffffff), AppColors.grey],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(path),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(width: responsiveWidth(context, 8)),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: responsiveHeight(context, 35),
                      width: responsiveWidth(context, 35),
                      decoration: BoxDecoration(
                        color: AppColors.light_green,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: SvgPicture.asset(
                          "assets/icons/heart.svg",
                          // width: responsiveWidth(context, 13),
                          // height: responsiveHeight(context, 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              CustomText(text: name, size: 14, weight: FontWeight.w600),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context, 13),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.electric_bolt_outlined,
                      color: Colors.orange,
                      size: 9,
                    ),
                    SizedBox(width: 2),
                    Flexible(
                      child: CustomText(
                        text: description,
                        size: 10,
                        weight: FontWeight.w300,
                        color: Color(0xff969AB0),
                        alignment: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              CustomText(
                text: "\$$price",
                size: 14,
                weight: FontWeight.w600,
                color: Colors.black,
              ),
              GestureDetector(
                child: Container(
                  height: responsiveHeight(context, 27),
                  width: responsiveWidth(context, 95),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: GestureDetector(
                      child: CustomText(
                        text: tr("order_now"),
                        size: 10,
                        weight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
