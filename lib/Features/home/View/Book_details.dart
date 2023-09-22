
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/book_model/book_model.dart';
import '../Presentation/Manager/Similar Books/similar_books_cubit.dart';
import 'Widgets/book_details_View_body.dart';

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
