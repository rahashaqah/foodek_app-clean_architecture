import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodek_app/core/network/api_client.dart';
import 'package:foodek_app/core/util/colors.dart';
import 'package:foodek_app/core/util/responsive.dart';
import 'package:foodek_app/view/widgets/appbar_widget.dart';
import 'package:foodek_app/view/widgets/banner_widget.dart';
import 'package:foodek_app/view/widgets/custom_text.dart';
import '../widgets/item_widget.dart';
import '../widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  late Future<List<dynamic>> categoriesFuture;

  @override
  void initState() {
    super.initState();
    categoriesFuture = loadCategories();
  }

  Future<List<dynamic>> loadCategories() async {
    final categories = await ApiClient().getCategories();
    categories.insert(0, {
      "id": 0,
      "name_en": "All",
      "name_ar": "الكل",
      "image": "",
    });
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: responsiveHeight(context, 20)),
            SearchBarWidget(),
            SizedBox(height: responsiveHeight(context, 30)),
            FutureBuilder<List<dynamic>>(
              future: categoriesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No categories found');
                }

                final categories = snapshot.data!;
                return buildTabs(categories);
              },
            ),
            SizedBox(height: responsiveHeight(context, 22)),
            buildPage(),
          ],
        ),
      ),
    );
  }

  Widget buildTabs(List<dynamic> categories) {
    // List<dynamic> categories = await ApiClient().getCategories();

    // [
    //   tr("all"),
    //   "🍔 " + tr("burger"),
    //   "🍕 " + tr("pizza"),
    //   "🌭 " + tr("sandwich"),
    //   "🍝 Pasta",
    //   "🍣 Sushi",
    //   "🥗 Salad",
    // ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 21)),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.green : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.green : AppColors.light_green,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomText(
                  text: category["name_en"],
                  size: 18,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildPage() {
    switch (selectedIndex) {
      case 0:
        return buildAll();
      default:
        return buildCategory(index: 1);
    }
  }

  Widget buildAll() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildBanner(),
        SizedBox(height: responsiveHeight(context, 5)),
        buildTopRated(),
        SizedBox(height: responsiveHeight(context, 12)),
        buildRecommended(),
        SizedBox(height: responsiveHeight(context, 40)),
      ],
    );
  }

  Widget buildCategory({required int index}) {
    final List<Map> items = [
      {
        "name": "Pepperoni pizza",
        "description":
            "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
        "price": "29",
        "path": "assets/images/pizza.png",
        "category": "1",
      },
      {
        "name": "Pepperoni pizza",
        "description":
            "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
        "price": "29",
        "path": "assets/images/pizza.png",
        "category": "1",
      },
      {
        "name": "Pepperoni pizza",
        "description":
            "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
        "price": "29",
        "path": "assets/images/pizza.png",
        "category": "1",
      },
      {
        "name": "Pepperoni pizza",
        "description":
            "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
        "price": "29",
        "path": "assets/images/pizza.png",
        "category": "1",
      },
      {
        "name": "Pepperoni pizza",
        "description":
            "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
        "price": "29",
        "path": "assets/images/pizza.png",
        "category": "1",
      },
      {
        "name": "Pepperoni pizza",
        "description":
            "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
        "price": "29",
        "path": "assets/images/pizza.png",
        "category": "1",
      },
      {
        "name": "Pepperoni pizza",
        "description":
            "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
        "price": "29",
        "path": "assets/images/pizza.png",
        "category": "1",
      },
      {
        "name": "Pepperoni pizza",
        "description":
            "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
        "price": "29",
        "path": "assets/images/pizza.png",
        "category": "1",
      },
      {
        "name": "Pepperoni pizza",
        "description":
            "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
        "price": "29",
        "path": "assets/images/pizza.png",
        "category": "1",
      },
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 33)),
      child: Column(
        children: [
          SizedBox(
            height: responsiveHeight(context, 560),
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: responsiveHeight(context, 11),
                crossAxisSpacing: responsiveWidth(context, 6),
                mainAxisExtent: responsiveHeight(context, 252),
              ),
              itemBuilder: (context, index) {
                return ItemWidget(
                  path: items[index]['path'],
                  name: items[index]['name'],
                  description: items[index]['description'],
                  price: items[index]['price'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBanner() {
    List<Map<String, String>> saleData = [
      {
        "title": "Experience our delicious new dish",
        "subtitle": "30% OFF",
        "path": "assets/images/pizza.png",
      },
      {
        "title": "Experience our delicious new dish",
        "subtitle": "30% OFF",
        "path": "assets/images/pizza.png",
      },
      {
        "title": "Experience our delicious new dish",
        "subtitle": "30% OFF",
        "path": "assets/images/pizza.png",
      },
    ];

    return BannerWidget(saleData: saleData);
  }

  Widget buildTopRated() {
    List<Map> topRatedData = [
      {
        "rating": "3.8",
        "path": "assets/images/burger.png",
        "title": "Chicken burger",
        "description": "100 gr chicken + tomato + cheese  Lettuce",
        "price": "20",
      },
      {
        "rating": "3.8",
        "path": "assets/images/burger.png",
        "title": "Chicken burger",
        "description": "100 gr chicken + tomato + cheese  Lettuce",
        "price": "20",
      },
      {
        "rating": "3.8",
        "path": "assets/images/burger.png",
        "title": "Chicken burger",
        "description": "100 gr chicken + tomato + cheese  Lettuce",
        "price": "20",
      },
      {
        "rating": "3.8",
        "path": "assets/images/burger.png",
        "title": "Chicken burger",
        "description": "100 gr chicken + tomato + cheese  Lettuce",
        "price": "20",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 30),
          ),
          child: CustomText(
            text: tr("top_rated"),
            alignment: TextAlign.start,
            size: 20,
            weight: FontWeight.w600,
          ),
        ),
        SizedBox(height: responsiveHeight(context, 13)),
        SizedBox(
          height: responsiveHeight(context, 209),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topRatedData.length,
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 25),
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: responsiveWidth(context, 17)),
                  width: responsiveWidth(context, 155),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.light_green),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            CustomText(text: "3.8", size: 12),
                          ],
                        ),
                        SizedBox(height: responsiveHeight(context, 4)),
                        Center(
                          child: SizedBox(
                            width: responsiveWidth(context, 87),
                            height: responsiveHeight(context, 70),
                            child: Image.asset(
                              topRatedData[index]['path'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        // Title
                        CustomText(
                          text: topRatedData[index]['title'],
                          size: 18,
                          weight: FontWeight.w500,
                          alignment: TextAlign.start,
                        ),

                        // Description
                        CustomText(
                          text: topRatedData[index]['description'],
                          size: 11,
                          weight: FontWeight.w400,
                          alignment: TextAlign.start,
                          color: AppColors.grey,
                        ),

                        // Price and Add Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\$20.",
                                    style: TextStyle(
                                      color: AppColors.green,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '00',
                                    style: TextStyle(
                                      color: AppColors.green,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: responsiveHeight(context, 24),
                              width: responsiveWidth(context, 24),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.green,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildRecommended() {
    List<Map> recommendedData = [
      {"path": "assets/images/sushi.png", "price": "108"},
      {"path": "assets/images/sushi.png", "price": "108"},
      {"path": "assets/images/sushi.png", "price": "108"},
      {"path": "assets/images/sushi.png", "price": "108"},
      {"path": "assets/images/sushi.png", "price": "108"},
      {"path": "assets/images/sushi.png", "price": "108"},
      {"path": "assets/images/sushi.png", "price": "108"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 30),
          ),
          child: Row(
            children: [
              CustomText(
                text: tr("recommend"),
                alignment: TextAlign.start,
                size: 16,
                weight: FontWeight.w600,
              ),
              Spacer(),
              CustomText(
                text: tr("view_all"),
                alignment: TextAlign.start,
                size: 12,
                weight: FontWeight.w600,
                color: AppColors.green,
              ),
              SizedBox(width: responsiveWidth(context, 10)),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.green,
                size: 12,
              ),
            ],
          ),
        ),
        SizedBox(height: responsiveHeight(context, 15)),
        SizedBox(
          height: responsiveHeight(context, 108),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 25),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: recommendedData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        margin: EdgeInsets.only(
                          right: responsiveWidth(context, 17),
                        ),
                        width: responsiveWidth(context, 72),
                        height: responsiveHeight(context, 108),
                        child: Image.asset(
                          recommendedData[index]['path'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 14,
                      right: 16,
                      child: Container(
                        height: responsiveHeight(context, 16),
                        width: responsiveWidth(context, 38),
                        //padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: CustomText(
                            text: "\$${recommendedData[index]['price']}",
                            size: 12,
                            color: Colors.white,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
