part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSuccsess extends NewestBooksState {
  final List<BookModel> books;

  const NewestBooksSuccsess(this.books);
}

class NewestBooksFaliure extends NewestBooksState {
  final String errmessage;

  const NewestBooksFaliure(this.errmessage);
}

class BooksFilteredsucsess extends NewestBooksState {
  final List<BookModel> books;

  const BooksFilteredsucsess(this.books);
}

class BooksFilteredFaliure extends NewestBooksState {
  final String errmessage;

  const BooksFilteredFaliure(this.errmessage);
}
