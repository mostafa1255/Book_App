import 'package:booklyapp/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Custom_App_Bar.dart';
import 'Custom_List_Item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Custom_AppBar(),
        ),
        FeaturedBooksListView(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 19),
          child: Text(
            "Best Seller",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, idex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: const CustomListViewItem(),
            );
          }),
    );
  }
}
