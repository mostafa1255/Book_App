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
      builder: (context, state) {
        if (State is FeaturedBooksSuccsess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idex) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(),
                  );
                }),
          );
        } else if (state is FeaturedBooksFaliure) {
          return Center(
              child: CustomErrorMessage(errmessage: state.errmessage));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
