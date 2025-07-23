import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import 'custom_text.dart';

class BannerWidget extends StatefulWidget {
  final List<Map<String, String>> saleData;

  const BannerWidget({Key? key, required this.saleData}) : super(key: key);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late PageController pageController;
  late ValueNotifier<int> currentPageNotifier;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    currentPageNotifier = ValueNotifier<int>(0);

    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      int nextPage = (currentPageNotifier.value + 1) % widget.saleData.length;
      pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    currentPageNotifier.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: responsiveWidth(context, 370),
          height: responsiveHeight(context, 134),
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(12),
          ),
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              currentPageNotifier.value = index;
            },
            children: List.generate(widget.saleData.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          context.locale.languageCode == 'ar'
                              ? EdgeInsets.only(right: 16.w)
                              : EdgeInsets.only(left: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: widget.saleData[index]['title']!,
                            weight: FontWeight.w400,
                            color: Colors.white,
                            size: 16,
                          ),
                          CustomText(
                            text: widget.saleData[index]['subtitle']!,
                            weight: FontWeight.w700,
                            color: Colors.white,
                            size: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  ClipRRect(
                    borderRadius:
                        context.locale.languageCode == 'ar'
                            ? BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            )
                            : BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),

                    child: Image.asset(
                      widget.saleData[index]['path']!,
                      height: responsiveHeight(context, 141),
                      width: responsiveWidth(context, 183),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        SizedBox(height: 5),
        ValueListenableBuilder<int>(
          valueListenable: currentPageNotifier,
          builder: (context, currentPage, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.saleData.length,
                (index) => Container(
                  width: 20.w,
                  height: 4.h,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:
                        currentPage == index
                            ? AppColors.green
                            : AppColors.light_green,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
