import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  final double rating;
  final int starCount;
  final Color color;
  final double size;

  const StarRatingWidget({
    super.key,
    required this.rating,
    this.starCount = 5,
    this.color = Colors.amber,
    this.size = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        double starValue = rating - index;
        IconData icon;
        if (starValue >= 1) {
          icon = Icons.star;
        } else if (starValue > 0) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }
        return Icon(icon, color: color, size: size);
      }),
    );
  }
}
