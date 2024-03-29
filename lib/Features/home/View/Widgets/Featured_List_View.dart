import 'package:booklyapp/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Presentation/Manager/Featured Books/featured_books_cubit.dart';
import 'Custom_ErrorMessage.dart';
import 'Custom_List_Item.dart';
import 'Custom_LoadingIndicator.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, State) {
        if (State is FeaturedBooksSuccsess) {
          Size device = MediaQuery.sizeOf(context);

          return SizedBox(
            height: device.height * 0.3,
            child: ListView.builder(
                itemCount: State.books.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: device.width * 0.03),
                    child: GestureDetector(
                      onTap: () => GoRouter.of(context).push(
                          Approuter.bookdetails,
                          extra: State.books[index]),
                      child: CustomBookImage(
                          urlImage: State.books[index].volumeInfo.imageLinks
                                  ?.thumbnail ??
                              "https://kbimages1-a.akamaihd.net/eac349ef-86d3-4ae3-a2c8-1d02dd23693a/353/569/90/False/c-programming-language-classmate-in-a-book-2021-release.jpg"),
                    ),
                  );
                }),
          );
        } else if (State is FeaturedBooksFaliure) {
          return Center(
              child: CustomErrorMessage(errmessage: State.errmessage));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
