import 'package:booklyapp/Features/home/Presentation/Manager/Newest%20Books/newest_books_cubit.dart';
import 'package:booklyapp/Features/home/View/Widgets/SearchListview.dart';
import 'package:booklyapp/core/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Custom_SerachTextField.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: device.width * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            txt: "Serach",
          ),
          SizedBox(
            height: device.height * 0.025,
          ),
          const Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: device.height * 0.02,
          ),
          Expanded(
              child: SearchRisultListView(
            device: device,
          ))
        ],
      ),
    );
  }
}
class SearchRisultListView extends StatefulWidget {
  const SearchRisultListView({super.key, required this.device});
  final Size device;

  @override
  State<SearchRisultListView> createState() => _SearchRisultListViewState();
}

class _SearchRisultListViewState extends State<SearchRisultListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is BooksFilteredsucsess) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                print("***************");
                print(state.books[0].volumeInfo.title);
                return SearchListview(
                  bookModel: state.books[index],
                );
              });
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
