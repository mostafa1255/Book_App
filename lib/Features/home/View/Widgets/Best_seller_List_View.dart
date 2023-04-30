import 'package:booklyapp/Features/home/Presentation/Manager/Newest%20Books/newest_books_cubit.dart';
import 'package:booklyapp/Features/home/View/Widgets/Custom_ErrorMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Best_seller_ListView.dart';
import 'Custom_LoadingIndicator.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, State) {
        if (State is NewestBooksSuccsess) {
          return ListView.builder(
              itemCount: State.books.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerListview(bookModel: State.books[index]),
                );
              });
        } else if (State is NewestBooksFaliure) {
          return CustomErrorMessage(errmessage: State.errmessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
