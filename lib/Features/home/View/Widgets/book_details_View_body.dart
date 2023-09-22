import 'package:flutter/material.dart';
import '../../../data/models/book_model/book_model.dart';
import 'Books_details_section.dart';
import 'Custom_Bookdetails_AppBar.dart';
import 'Similar_book_section.dart';

class BookdetailsViewBody extends StatelessWidget {
  const BookdetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
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
                BookDetailsSection(
                  width: width,
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                const SimilarBooksSections()
              ],
            ),
          ),
        )
      ],
    );
  }
}
