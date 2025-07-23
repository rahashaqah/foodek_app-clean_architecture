import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodek_app/core/util/extension.dart';
import '../../core/util/colors.dart';
import 'custom_text.dart';

class SwitcherWidget extends StatelessWidget {
  final List<String> tabs;
  final ValueNotifier<String> selectedTabNotifier;
  final PageController pageController;
  final List<Widget> pages;

  SwitcherWidget({
    super.key,
    required this.tabs,
    required ValueNotifier<String> selectedTabNotifier,
    required this.pageController,
    required this.pages,
  }) : selectedTabNotifier =
           selectedTabNotifier
             ..value =
                 selectedTabNotifier.value.isEmpty
                     ? tabs[0]
                     : selectedTabNotifier.value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(tabs.length, (index) {
                  String tab = tabs[index];
                  return GestureDetector(
                    onTap: () {
                      selectedTabNotifier.value = tab;
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: SizedBox(
                      width: context.screenWidth / tabs.length,
                      child: ValueListenableBuilder<String>(
                        valueListenable: selectedTabNotifier,
                        builder: (context, selectedTab, child) {
                          return Column(
                            children: [
                              CustomText(
                                text: tab,
                                weight: FontWeight.w600,
                                color:
                                    selectedTab == tab ||
                                            (selectedTab.isEmpty && index == 0)
                                        ? AppColors.green
                                        : Colors.grey,
                                size: 16.sp,
                              ),
                              SizedBox(height: 5.h),
                              Container(
                                height: 2.h,
                                width: double.infinity,
                                color:
                                    selectedTab == tab ||
                                            (selectedTab.isEmpty && index == 0)
                                        ? AppColors.green
                                        : AppColors.grey,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.65,
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  selectedTabNotifier.value = tabs[index];
                },
                children: pages,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
