import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Presentation/Manager/Newest Books/newest_books_cubit.dart';
import 'Best_seller_ListView.dart';
import 'Custom_ErrorMessage.dart';
import 'Custom_LoadingIndicator.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.sizeOf(context);
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
                  padding:
                      EdgeInsets.symmetric(vertical: device.height * 0.015),
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
