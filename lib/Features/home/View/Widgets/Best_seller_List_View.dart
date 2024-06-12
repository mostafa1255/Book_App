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
      builder: (context, state) {
        if (state is NewestBooksSuccsess) {
          return ListView.builder(
              itemCount: state.books.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: device.height * 0.015),
                  child: BestSellerListview(bookModel: state.books[index]),
                );
              });
        } else if (state is NewestBooksFaliure) {
          return CustomErrorMessage(errmessage: state.errmessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
