import 'package:flutter/material.dart';

import 'Custom_List_Item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, idex) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomListViewItem(),
            );
          }),
    );
  }
}
