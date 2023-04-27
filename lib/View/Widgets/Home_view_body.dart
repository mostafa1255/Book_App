import 'package:booklyapp/View/Widgets/Best_seller_List_View.dart';
import 'package:booklyapp/core/Styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Best_seller_ListView.dart';
import 'Custom_App_Bar.dart';
import 'Featured_List_View.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Custom_AppBar(),
              ),
              const FeaturedBooksListView(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text("Best Seller",
                    style: Styles.textStyle18.copyWith(fontSize: 21)),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: BestSellerListView(),
        )
      ],
    );
  }
}
