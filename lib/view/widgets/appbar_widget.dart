import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // fixed typo
import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import 'custom_text.dart';
import 'notification_wiget.dart';

PreferredSizeWidget AppBarWidget({
  required BuildContext context,
  bool hideLocation = false,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    forceMaterialTransparency: true,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          if (!hideLocation) ...[
            Container(
              padding: const EdgeInsets.all(5),
              width: responsiveWidth(context, 34),
              height: responsiveHeight(context, 34),
              decoration: BoxDecoration(
                color: AppColors.light_green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                'assets/icons/location.svg',
                color: AppColors.green,
              ),
            ),
            SizedBox(width: responsiveWidth(context, 10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: tr("current_location"),
                      color: AppColors.grey,
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                    Icon(Icons.arrow_drop_down, color: AppColors.grey),
                  ],
                ),
                CustomText(
                  text: 'JI. Soekarno Hatta 15A...',
                  size: 14,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ],
          const Spacer(),
          InkWell(
            onTap: () => showNotifications(context),
            child: Container(
              padding: const EdgeInsets.all(5),
              width: responsiveWidth(context, 34),
              height: responsiveHeight(context, 34),
              decoration: BoxDecoration(
                color: AppColors.off_white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset('assets/icons/bell.svg'),
            ),
          ),
        ],
      ),
    ),
  );
}
