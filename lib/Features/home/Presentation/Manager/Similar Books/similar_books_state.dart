part of 'similar_books_cubit.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSucsess extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSucsess(this.books);
}

class SimilarBooksFaliure extends SimilarBooksState {
  final String errmessage;

  const SimilarBooksFaliure(this.errmessage);
}
