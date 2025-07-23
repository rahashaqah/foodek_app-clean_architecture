import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hintText;
  final Color? searchIconColor;
  final bool showFilter;
  final Color? backgroundColor;

  const SearchBarWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.searchIconColor,
    this.showFilter = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: responsiveWidth(context, 370),
        height: responsiveHeight(context, 42),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.grey),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            SizedBox(
              height: responsiveHeight(context, 16),
              width: responsiveWidth(context, 16),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                color: searchIconColor ?? AppColors.light_grey,
              ),
            ),
            SizedBox(width: responsiveWidth(context, 8)),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: TextStyle(fontSize: 12, color: AppColors.grey),
                decoration: InputDecoration(
                  hintText: hintText ?? tr("search_menu_restaurant_or_etc"),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
            if (showFilter)
              SizedBox(
                height: responsiveHeight(context, 16),
                width: responsiveWidth(context, 16),
                child: SvgPicture.asset(
                  'assets/icons/filter.svg',
                  color: AppColors.light_grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
