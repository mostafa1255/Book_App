import 'package:booklyapp/core/Styles.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/models/book_model/book_model.dart';

class BookRate extends StatelessWidget {
  BookRate({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.Rating,
    required this.CountRating,
  });
  MainAxisAlignment mainAxisAlignment;
  final num Rating;
  final num CountRating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 14,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          Rating.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 6,
        ),
        Opacity(
            opacity: 0.6,
            child:
                Text("(${CountRating.toString()})", style: Styles.textStyle14))
      ],
    );
  }
}
