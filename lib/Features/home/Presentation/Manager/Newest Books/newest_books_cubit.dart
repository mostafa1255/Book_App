import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../data/models/book_model/book_model.dart';
import '../../../../data/repos/home_repos.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  List<BookModel>? allBooks;
  List<BookModel> allItems = [];
  Future<void> fetchNewestSellerBook() async {
    emit(NewestBooksLoading());

    var result = await homeRepo.fetchNewestSellerBook();

    result.fold((faliure) {
      emit(NewestBooksFaliure(faliure.errmessage));
    }, (books) {
      allBooks = books;
      emit(NewestBooksSuccsess(books));
    });
  }

  void updateList({required String value}) {
    try {
      allItems = allBooks!
          .where((element) => element.volumeInfo.title!
              .toLowerCase()
              .startsWith(value.toLowerCase()))
          .toList();

      print("In try Filter");
      print(allItems[0].volumeInfo.title);
      emit(BooksFilteredsucsess(allItems));
    } on Exception catch (e) {
      print("In catch Filter");
      emit(BooksFilteredFaliure(e.toString()));
    }
  }
}
