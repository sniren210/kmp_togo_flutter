import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/pages/rating.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating, iconSize;
  final RatingChangeCallback? onRatingChanged;
  final Color color;

  StarRating(
      {this.starCount = 5,
        this.rating = .0,
        required this.onRatingChanged,
        required this.color,
        required this.iconSize});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        size: iconSize,
        color: color,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        size: iconSize,
        color: color,
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: iconSize,
        color: color,
      );
    }
    return new InkResponse(
      onTap:
      onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children:
        new List.generate(starCount, (index) => buildStar(context, index)));
  }
}