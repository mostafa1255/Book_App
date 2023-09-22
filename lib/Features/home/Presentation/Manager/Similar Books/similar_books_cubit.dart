import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../../data/models/book_model/book_model.dart';
import '../../../../data/repos/home_repos.dart';
part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());

    var result = await homeRepo.fetchSimilarBooks(Category: category);

    result.fold((faliure) {
      emit(SimilarBooksFaliure(faliure.errmessage));
    }, (books) {
      emit(SimilarBooksSucsess(books));
    });
  }
}
