import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodek_app/view/widgets/appbar_widget.dart';
import 'package:foodek_app/view/widgets/custom_text.dart';
import 'package:foodek_app/view/widgets/search_widget.dart';
import 'package:foodek_app/view/widgets/switcher_widget.dart';
import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/empty_widget.dart';
import '../widgets/history_item_widget.dart';
import '../widgets/order_sheet_widget.dart';
import '../widgets/text_field_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

List<String> options = ["Card", "Cash"];

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> myTabs = ["Cart", "History"];
  ValueNotifier<String> selectedTabNotifier = ValueNotifier("Cart");
  PageController pageController = PageController();
  bool cartEmpty = false;
  bool historyEmpty = true;
  int status = 0;

  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage() {
    switch (status) {
      case 0:
        return _buildSwitcher();
      case 1:
        return _buildLocation();
      case 2:
        return _buildCheckout();
      case 3:
        return _buildAddCard();
      case 4:
        return _buildCheckedout();
      default:
        return _buildSwitcher();
    }
  }

  Widget _buildSwitcher() {
    final List<Map> items = [
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Chicken Burger",
        "description": "Burger factory LTD",
        "price": 20.0,
        "date": "25.3.2024",
      },
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Cheese Burger",
        "description": "Burger factory LTD",
        "price": 25.0,
        "date": "25.3.2024",
      },
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Cheese Burger",
        "description": "Burger factory LTD",
        "price": 25.0,
        "date": "25.3.2024",
      },
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Cheese Burger",
        "description": "Burger factory LTD",
        "price": 25.0,
        "date": "25.3.2024",
      },
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Cheese Burger",
        "description": "Burger factory LTD",
        "price": 25.0,
        "date": "25.3.2024",
      },
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Cheese Burger",
        "description": "Burger factory LTD",
        "price": 25.0,
        "date": "25.3.2024",
      },
    ];
    return Scaffold(
      appBar: AppBarWidget(context: context),
      body: Column(
        children: [
          SwitcherWidget(
            tabs: myTabs,
            selectedTabNotifier: selectedTabNotifier,
            pageController: pageController,
            pages: [
              cartEmpty
                  ? EmptyWidget(
                    title: "Cart Empty",
                    subtitle:
                        "You don't have add any foods in cart at this time",
                    emptyImage: "assets/images/empty.png",
                  )
                  : Stack(
                    children: [
                      ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return CartItemWidget(
                            path: items[index]['path'],
                            title: items[index]['title'],
                            description: items[index]['description'],
                            price: items[index]['price'],
                            onDismissed: () {},
                          );
                        },
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: OrderSheetWidget(
                          context: context,
                          onTap: () {
                            setState(() {
                              status = 1;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
              historyEmpty
                  ? EmptyWidget(
                    title: "History Empty",
                    subtitle: "You don't have order any foods before",
                    emptyImage: "assets/images/empty.png",
                  )
                  : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return HistoryItemWidget(
                        path: items[index]['path'],
                        title: items[index]['title'],
                        description: items[index]['description'],
                        price: items[index]['price'],
                        date: items[index]['date'],
                      );
                    },
                  ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/map.png'),
          Column(
            children: [
              Spacer(flex: 1),
              SearchBarWidget(
                backgroundColor: Colors.white,
                showFilter: false,
                hintText: 'Find your location',
                searchIconColor: AppColors.green,
              ),
              Spacer(flex: 8),
              Container(
                height: responsiveHeight(context, 154),
                width: responsiveWidth(context, 343),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'your location',
                        color: AppColors.grey,
                        size: 12,
                        weight: FontWeight.w500,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/location.svg'),
                          CustomText(
                            text: '123 Al-Madina Street, Abdali, Amman, Jordan',
                            color: AppColors.grey,
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                      SizedBox(height: responsiveHeight(context, 18)),
                      ButtonWidget(
                        dataName: "Set Location",
                        onTap: () {
                          setState(() {
                            status = 2;
                          });
                        },
                        colors: Colors.white,
                        width: 295,
                        height: 48,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckout() {
    return Scaffold(
      appBar: AppBarWidget(context: context, hideLocation: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 22)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsiveHeight(context, 30)),
            CustomText(text: "Checkout", size: 20, weight: FontWeight.w600),
            SizedBox(height: responsiveHeight(context, 18)),
            CustomText(text: "Pay With:", size: 18, weight: FontWeight.w600),
            SizedBox(height: responsiveHeight(context, 12)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/circle.svg'),
                    SizedBox(height: responsiveHeight(context, 4)),
                    Container(
                      height: responsiveHeight(context, 22),
                      width: responsiveWidth(context, 1),
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 4)),

                    SvgPicture.asset('assets/icons/circleB.svg'),
                  ],
                ),
                SizedBox(width: responsiveWidth(context, 14)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "88 Zurab Gorgiladze St",
                      weight: FontWeight.w400,
                      size: 15,
                    ),
                    CustomText(
                      text: "Georgia, Batumi",
                      weight: FontWeight.w400,
                      size: 13,
                      color: AppColors.light_grey,
                    ),
                    SizedBox(height: responsiveHeight(context, 8)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "88 Zurab Gorgiladze St",
                              weight: FontWeight.w400,
                              size: 15,
                            ),
                            CustomText(
                              text: "Georgia, Batumi",
                              weight: FontWeight.w400,
                              size: 13,
                              color: AppColors.light_grey,
                            ),
                          ],
                        ),
                        SizedBox(width: responsiveWidth(context, 136)),
                        GestureDetector(
                          child: CustomText(
                            text: "Change",
                            weight: FontWeight.w600,
                            size: 14,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 27)),
            CustomText(text: "Promo Code?", size: 16, weight: FontWeight.w600),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: responsiveHeight(context, 42),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Promo',
                        hintStyle: TextStyle(
                          color: AppColors.light_grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: responsiveHeight(context, 42),
                  width: responsiveWidth(context, 90),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Your add logic here
                    },
                    child: Center(
                      child: CustomText(
                        text: 'Add',
                        size: 12,
                        weight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 27)),
            CustomText(text: "Pay With:", size: 18, weight: FontWeight.w600),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<String>(
                  value: options[0],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value!;
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                CustomText(text: 'Card', size: 16, weight: FontWeight.w500),
                Radio<String>(
                  value: options[1],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value!;
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                CustomText(text: 'Cash', size: 16, weight: FontWeight.w500),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 5)),
            CustomText(text: "Card Type:", size: 18, weight: FontWeight.w600),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<String>(
                  value: options[0],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value!;
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                SvgPicture.asset('assets/icons/mastercard.svg'),
                SizedBox(width: responsiveWidth(context, 6)),
                Radio<String>(
                  value: options[1],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value!;
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                SvgPicture.asset('assets/icons/visa.svg'),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 10)),

            OrderSheetWidget(
              context: context,
              padding: 0,
              onTap: () {
                setState(() {
                  status = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddCard() {
    TextEditingController nameTextEditingController = TextEditingController();
    TextEditingController cardNumTextEditingController =
        TextEditingController();
    return Scaffold(
      appBar: AppBarWidget(context: context, hideLocation: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 33)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Add Card", size: 20, weight: FontWeight.w600),
            SizedBox(height: responsiveHeight(context, 19)),
            Image.asset("assets/images/card.png"),
            SizedBox(height: 16),
            TextFieldWidget(
              textEditingController: nameTextEditingController,
              obscureText: false,
              label: "Name",
              hintText: "Raya Daboor",
              keyboardType: TextInputType.text,
              height: responsiveHeight(context, 46),
              width: responsiveWidth(context, 368),
            ),
            SizedBox(height: 20),
            TextField(
              controller: cardNumTextEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Card Number"),
                hintText: '6578 8756 4238 92764',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    'assets/icons/cards.svg',
                    height: responsiveHeight(context, 38),
                    width: responsiveWidth(context, 38),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              style: TextStyle(height: 1.5),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expiry",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          hintText: "04/23",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CVC',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '875',
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  textAlign: TextAlign.center,
                  "We will send you an order details to your\nemail after the successful payment",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF929DA9),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    status = 4;
                  });
                },
                icon: Icon(Icons.lock, color: Colors.white),
                label: Text(
                  "Pay for the order",
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF25AE4B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckedout() {
    return Scaffold(
      appBar: AppBarWidget(context: context, hideLocation: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: responsiveHeight(context, 27)),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: responsiveWidth(context, 22)),
              child: CustomText(
                text: "Checkout",
                weight: FontWeight.w600,
                size: 20,
              ),
            ),
          ),
          SizedBox(height: responsiveHeight(context, 106)),
          Image.asset('assets/images/checkout.png'),
          SizedBox(height: responsiveHeight(context, 32)),
          CustomText(
            text: 'Your Order Done Successfully',
            size: 24,
            weight: FontWeight.w700,
          ),
          SizedBox(height: responsiveHeight(context, 12)),
          CustomText(
            text:
                'you will get your order within 12min\nthanks for using our services',
            size: 20,
            weight: FontWeight.w400,
            color: AppColors.light_grey,
          ),
          SizedBox(height: responsiveHeight(context, 30)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 51),
            ),
            child: ButtonWidget(
              dataName: "track Your Order",
              colors: Colors.white,
              onTap: () {},
              radius: 16,
            ),
          ),
        ],
      ),
    );
  }
}
