import 'package:booklyapp/core/Styles.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRate extends StatelessWidget {
  const BookRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
    const   Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 15,
        ),
      const  SizedBox(
          width: 6.3,
        ),
      const  Text(
          "4.8",
          style: Styles.textStyle16,
        ),
      const  SizedBox(
          width: 6,
        ),
        Text(
          "(245)",
          style: Styles.textStyle14.copyWith(color: Color(0xff707070)),
        )
      ],
    );
  }
}
