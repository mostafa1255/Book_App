import 'package:booklyapp/Features/home/View/Widgets/book_details_View_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookdetailsViewBody(),
    );
  }
}