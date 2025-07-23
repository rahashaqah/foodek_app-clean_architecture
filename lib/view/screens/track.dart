import 'package:flutter/material.dart';
import 'package:foodek_app/core/util/extension.dart';
import 'package:foodek_app/core/util/responsive.dart';
import 'package:foodek_app/view/widgets/appbar_widget.dart';
import 'package:foodek_app/view/widgets/custom_text.dart';
import 'package:foodek_app/view/widgets/search_widget.dart';

import '../../core/util/colors.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  int status = 0;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case 0:
        return _buildOrder();
      default:
        return _buildOrder();
    }
  }

  _buildOrder() {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/map.png',
                height: context.screenHeight * 0.6,
                width: context.screenWidth,
                fit: BoxFit.fill,
              ),
              Column(
                children: [
                  SizedBox(height: responsiveHeight(context, 70)),
                  SearchBarWidget(
                    searchIconColor: AppColors.green,
                    hintText: 'Find your location',
                    backgroundColor: Colors.white,
                    showFilter: false,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: responsiveHeight(context, 30)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 21),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'On The Way', weight: FontWeight.w600),
                GestureDetector(
                  child: CustomText(
                    text: 'All Details',
                    weight: FontWeight.w600,
                    size: 14,
                    color: AppColors.green,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: responsiveHeight(context, 15)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 21),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProgressItem(text: 'Order Placed', progress: 0.5),
                _buildProgressItem(text: 'On The Way', progress: 0),
                _buildProgressItem(text: 'Delivered', progress: 0),
              ],
            ),
          ),
          SizedBox(height: responsiveHeight(context, 25)),
          _buildDeliveryMan(name: "Alexander V.", rating: 4.9),
          SizedBox(height: responsiveHeight(context, 15)),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 21),
            ),
            child: Divider(height: 1, color: AppColors.off_white),
          ),
          _buildYourLocation(
            location: '123 Al-Madina Street, Abdali, Amman, Jordan',
          ),
        ],
      ),
    );
  }

  Widget _buildProgressItem({required String text, required double progress}) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: text, size: 14, color: AppColors.light_grey),
            SizedBox(height: responsiveHeight(context, 4)),
            SizedBox(
              width: responsiveWidth(context, 100),
              height: responsiveHeight(context, 4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.grey,
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliveryMan({
    required String name,
    required double rating,
    String? phone,
    Image? image,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 21)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          SizedBox(width: responsiveWidth(context, 10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Your Delivery Hero',
                color: AppColors.grey,
                size: 14,
              ),
              Row(
                children: [
                  CustomText(text: name, color: Colors.black, size: 16),
                  SizedBox(width: responsiveWidth(context, 10)),
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  CustomText(
                    text: rating.toString(),
                    size: 14,
                    color: AppColors.light_grey,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: responsiveHeight(context, 45),
              width: responsiveWidth(context, 45),
              decoration: BoxDecoration(
                color: AppColors.off_white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(Icons.phone, color: AppColors.green, size: 22),
            ),
          ),
          SizedBox(width: responsiveWidth(context, 15)),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: responsiveHeight(context, 45),
              width: responsiveWidth(context, 45),
              decoration: BoxDecoration(
                color: AppColors.off_white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(Icons.message, color: Colors.orange, size: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYourLocation({required String location}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 21)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: responsiveHeight(context, 10)),

          CustomText(
            text: "your location",
            color: AppColors.light_grey,
            size: 14,
          ),
          SizedBox(height: responsiveHeight(context, 5)),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: AppColors.green),
              CustomText(text: location, color: AppColors.light_grey, size: 12),
            ],
          ),
        ],
      ),
    );
  }
}
