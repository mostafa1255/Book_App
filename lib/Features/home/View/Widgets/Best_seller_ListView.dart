import 'package:booklyapp/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/Constants.dart';
import '../../../../core/Styles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'Book_Rating.dart';
import 'Custom_List_Item.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Approuter.bookdetails, extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: device.height * 0.18,
          child: Row(
            children: [
              CustomBookImage(
                  urlImage: bookModel.volumeInfo.imageLinks?.thumbnail ??
                      "https://kbimages1-a.akamaihd.net/eac349ef-86d3-4ae3-a2c8-1d02dd23693a/353/569/90/False/c-programming-language-classmate-in-a-book-2021-release.jpg"),
              SizedBox(
                width: device.width * 0.05,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: device.width * 0.5,
                      child: Text(
                        bookModel.volumeInfo.title.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: KGtSectorFine),
                      ),
                    ),
                    SizedBox(
                      height: device.height * 0.008,
                    ),
                    Text(
                      bookModel.volumeInfo.authors.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14,
                    ),
                    SizedBox(
                      height: device.height * 0.008,
                    ),
                    Row(
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        BookRate(
                          Rating: bookModel.volumeInfo.averageRating ?? 5.2,
                          CountRating: bookModel.volumeInfo.ratingsCount ?? 300,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
