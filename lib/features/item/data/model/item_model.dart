import '../../domain/entity/item_entity.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    super.image,
    required super.name,
    super.description,
    required super.price,
    required super.rating,
    super.numOfReviews,
  });

  factory ItemModel.fromJson({required Map<String, dynamic> json}) {
    return ItemModel(
      image: json['image'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      rating: json['rating'],
      numOfReviews: json['numOfReviews'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['rating'] = rating;
    data['numOfReviews'] = numOfReviews;
    return data;
  }
}
