import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodek_app/view/widgets/appbar_widget.dart';
import 'package:foodek_app/view/widgets/custom_text.dart';
import 'package:foodek_app/view/widgets/search_widget.dart';

import '../../core/util/responsive.dart';
import '../widgets/item_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    ];

    return Scaffold(
      appBar: AppBarWidget(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: responsiveHeight(context, 22)),
              SearchBarWidget(),
              SizedBox(height: responsiveHeight(context, 30)),
              CustomText(
                text: tr("favorites"),
                size: 20,
                weight: FontWeight.w600,
              ),
              SizedBox(height: responsiveHeight(context, 6)),
              SizedBox(
                height: responsiveHeight(context, 585),
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
        ),
      ),
    );
  }
}
