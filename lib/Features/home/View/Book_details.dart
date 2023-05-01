import 'package:booklyapp/Features/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/Presentation/Manager/Similar%20Books/similar_books_cubit.dart';
import 'package:booklyapp/Features/home/View/Widgets/book_details_View_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookdetailsViewBody(bookModel: widget.bookModel),
    );
  }
}
