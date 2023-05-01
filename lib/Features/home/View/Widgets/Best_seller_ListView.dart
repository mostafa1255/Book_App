import 'package:booklyapp/Features/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/View/Widgets/Book_Rating.dart';
import 'package:booklyapp/Features/home/View/Widgets/Custom_List_Item.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/Constants.dart';
import '../../../../core/Styles.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Approuter.bookdetails, extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 130,
          child: Row(
            children: [
              CustomBookImage(
                  urlImage: bookModel.volumeInfo.imageLinks?.thumbnail ??
                      "https://kbimages1-a.akamaihd.net/eac349ef-86d3-4ae3-a2c8-1d02dd23693a/353/569/90/False/c-programming-language-classmate-in-a-book-2021-release.jpg"),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        bookModel.volumeInfo.title.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: KGtSectorFine),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      bookModel.volumeInfo.authors.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14,
                    ),
                    const SizedBox(
                      height: 3,
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
