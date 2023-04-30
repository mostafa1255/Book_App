import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/data/repos/home_repos.dart';
import 'package:equatable/equatable.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestSellerBook() async {
    emit(NewestBooksLoading());

    var result = await homeRepo.fetchNewestSellerBook();

    result.fold((faliure) {
      emit(NewestBooksFaliure(faliure.errmessage));
    }, (books) {
      emit(NewestBooksSuccsess(books));
    });
  }
}
