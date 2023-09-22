import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../data/models/book_model/book_model.dart';
import '../../../../data/repos/home_repos.dart';
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
