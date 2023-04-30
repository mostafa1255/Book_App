import 'package:booklyapp/Features/home/Presentation/Manager/Featured%20Books/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/View/Widgets/Custom_ErrorMessage.dart';
import 'package:booklyapp/Features/home/View/Widgets/Custom_LoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Custom_List_Item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, State) {
        if (State is FeaturedBooksSuccsess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                itemCount: State.books.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(
                        urlImage: State.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            "https://kbimages1-a.akamaihd.net/eac349ef-86d3-4ae3-a2c8-1d02dd23693a/353/569/90/False/c-programming-language-classmate-in-a-book-2021-release.jpg"),
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
