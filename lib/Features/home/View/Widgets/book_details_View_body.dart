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
    var device = MediaQuery.sizeOf(context);

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: device.width * 0.05,
                vertical: device.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomBookdetailsAppBar(),
                BookDetailsSection(
                  device: device,
                  bookModel: bookModel,
                ),
                Expanded(
                  child: SizedBox(
                    height: device.height * 0.03,
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
