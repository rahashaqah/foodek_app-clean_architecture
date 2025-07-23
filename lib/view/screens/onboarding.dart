import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodek_app/core/util/extension.dart';
import 'package:foodek_app/core/util/responsive.dart';
import 'package:foodek_app/view/screens/get_location.dart';
import 'package:foodek_app/features/login/presentation/screen/login.dart';
import 'package:foodek_app/view/widgets/custom_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/util/colors.dart';
import '../../translations/locale_keys.g.dart';
import '../widgets/custom_gradient_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPosition = index;
                });
              },
              children: [
                _buildOnboardingContent(
                  'assets/images/onboarding1.png',
                  tr("Welcome To Sahlah"),
                  tr("enjoy_fast_delivery"),
                ),
                _buildOnboardingContent(
                  'assets/images/onboarding2.png',
                  tr("Get Delivery On Time"),
                  tr(
                    "Order Your Favorite Food Within The Palm Of Your Hand And the Zone Of Your Comfort",
                  ),
                ),
                _buildOnboardingContent(
                  'assets/images/onboarding2.png',
                  tr("Choose Your Food"),
                  tr(
                    "Order Your Favorite Food Within The Palm Of Your Hand And the Zone Of Your Comfort",
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                },
                child:
                    currentPosition == 0
                        ? Container()
                        : CustomText(text: tr("Skip"), size: 16),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: JumpingDotEffect(
                  activeDotColor: AppColors.green,
                  dotColor: AppColors.off_white,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              TextButton(
                onPressed: () {
                  pageController.page != 2
                      ? pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear,
                      )
                      : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetLocationScreen(),
                        ),
                      );
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.green,
                  size: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: context.screenHeight * 0.04),
        ],
      ),
    );
  }

  Widget _buildOnboardingContent(String path, String title, String subtitle) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset('assets/images/pattern.png'),
        Container(
          height: context.screenHeight * 0.65,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.5),
                spreadRadius: 50,
                blurRadius: 50,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 55),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(flex: 5),
              Image.asset(path),
              SizedBox(height: responsiveHeight(context, 30)),
              CustomText(text: title, size: 32, weight: FontWeight.w500),
              SizedBox(height: responsiveHeight(context, 10)),
              CustomText(text: subtitle, size: 16, weight: FontWeight.w400),
              SizedBox(height: responsiveHeight(context, 90)),
              CustomGradientButton(
                text: LocaleKeys.Continue.tr(),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ],
    );
  }
}
