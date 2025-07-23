import 'dart:ui';

class ItemEntity {
  Image? image;
  String name;
  String? description;
  double price;
  double rating;
  int? numOfReviews;

  ItemEntity({
    this.image,
    required this.name,
    this.description,
    required this.price,
    required this.rating,
    this.numOfReviews,
  });
}
