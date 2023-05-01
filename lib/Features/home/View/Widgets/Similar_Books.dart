import 'package:booklyapp/Features/home/Presentation/Manager/Similar%20Books/similar_books_cubit.dart';
import 'package:booklyapp/Features/home/View/Widgets/Custom_ErrorMessage.dart';
import 'package:booklyapp/Features/home/View/Widgets/Custom_List_Item.dart';
import 'package:booklyapp/Features/home/View/Widgets/Custom_LoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, State) {
        if (State is SimilarBooksSucsess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
                itemCount: State.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
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
        } else if (State is SimilarBooksFaliure) {
          return CustomErrorMessage(errmessage: State.errmessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
