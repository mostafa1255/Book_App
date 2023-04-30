import 'package:booklyapp/Features/home/View/Widgets/Book_Rating.dart';
import 'package:flutter/material.dart';

import '../../../../core/Styles.dart';
import 'Book_Action.dart';
import 'Custom_List_Item.dart';

class BookDetailsSection extends StatelessWidget {
  BookDetailsSection({super.key, required this.width});
  var width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.19),
          child: const CustomBookImage(urlImage: "assets/images/images.jpeg"),
        ),
        const SizedBox(
          height: 43,
        ),
        const Text(
          "The Jungle Book",
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        //  BookRate(
        //    mainAxisAlignment: MainAxisAlignment.center,
        //  ),
        const SizedBox(
          height: 30,
        ),
        const BooksAction(),
      ],
    );
  }
}
