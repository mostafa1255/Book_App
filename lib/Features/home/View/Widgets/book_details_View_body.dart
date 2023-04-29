import 'package:booklyapp/Features/home/View/Widgets/Book_Action.dart';
import 'package:booklyapp/core/Styles.dart';
import 'package:flutter/material.dart';
import 'Book_Rating.dart';
import 'Custom_Bookdetails_AppBar.dart';
import 'Custom_List_Item.dart';

import 'Similar_Books.dart';

class BookdetailsViewBody extends StatelessWidget {
  const BookdetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomBookdetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.19),
                  child: const CustomBookImage(),
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
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                BookRate(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                const BooksAction(),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SimilarBooksListView(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
