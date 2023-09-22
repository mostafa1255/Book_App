import 'dart:ffi';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../../data/models/book_model/book_model.dart';
import '../../../../data/repos/home_repos.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await homeRepo.fetchFeaturedBooks();

    result.fold((faliure) {
      emit(FeaturedBooksFaliure(faliure.errmessage));
    }, (books) {
      emit(FeaturedBooksSuccsess(books));
    });
  }
}
