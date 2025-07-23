import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodek_app/core/util/colors.dart';
import 'package:foodek_app/core/util/extension.dart';
import 'package:foodek_app/features/login/presentation/screen/login.dart';
import '../../core/util/responsive.dart';
import '../widgets/custom_gradient_button.dart';
import '../widgets/custom_text.dart';

class GetLocationScreen extends StatefulWidget {
  const GetLocationScreen({super.key});

  @override
  State<GetLocationScreen> createState() => _GetLocationScreenState();
}

class _GetLocationScreenState extends State<GetLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('assets/images/map_pattern.png', width: double.infinity),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: context.screenHeight * 0.72,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.9),
                      spreadRadius: 50,
                      blurRadius: 50,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context, 33),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(flex: 7),
                    Image.asset(
                      'assets/images/onboarding2.png',
                      height: responsiveHeight(context, 219),
                      width: responsiveWidth(context, 328.5),
                    ),
                    SizedBox(height: responsiveHeight(context, 30)),
                    CustomText(
                      text: tr("turn_on_your_location"),
                      size: 32,
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: responsiveHeight(context, 10)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(context, 50),
                      ),
                      child: CustomText(
                        text: tr("device_turn_on_location"),
                        size: 16,
                        weight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 40)),
                    CustomGradientButton(
                      text: tr("yes_turn_on"),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: context.screenHeight * 0.015),
                    CustomGradientButton(
                      text: tr("cancel"),
                      textColor: AppColors.dark_grey,
                      colors: [AppColors.grey, AppColors.grey],
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                    Spacer(flex: 4),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
