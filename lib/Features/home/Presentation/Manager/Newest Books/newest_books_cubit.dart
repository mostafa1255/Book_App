import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit() : super(NewestBooksInitial());
  
}
