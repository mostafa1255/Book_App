import 'package:booklyapp/core/Styles.dart';
import 'package:flutter/material.dart';
import 'Best_seller_ListView.dart';
import 'Custom_SerachTextField.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSearchTextField(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: SearchRisultListView())
        ],
      ),
    );
  }
}

class SearchRisultListView extends StatelessWidget {
  const SearchRisultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: BestSellerListview(),
          );
        });
    ;
  }
}
