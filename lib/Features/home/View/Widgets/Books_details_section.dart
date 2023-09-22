
import 'package:flutter/material.dart';
import '../../../../core/Styles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'Book_Action.dart';
import 'Book_Rating.dart';
import 'Custom_List_Item.dart';

class BookDetailsSection extends StatelessWidget {
  BookDetailsSection({super.key, required this.width, required this.bookModel});
  var width;
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.19),
          child: CustomBookImage(
              urlImage: bookModel.volumeInfo.imageLinks?.thumbnail ??
                  "https://kbimages1-a.akamaihd.net/eac349ef-86d3-4ae3-a2c8-1d02dd23693a/353/569/90/False/c-programming-language-classmate-in-a-book-2021-release.jpg"),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title.toString(),
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors.toString(),
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BookRate(
          CountRating: bookModel.volumeInfo.ratingsCount?.toInt() ?? 300,
          Rating: bookModel.volumeInfo.averageRating?.toInt() ?? 5.2,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 30,
        ),
        BooksAction(bookModel: bookModel),
      ],
    );
  }
}
