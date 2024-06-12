import 'package:booklyapp/Features/home/Presentation/Manager/Newest%20Books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatefulWidget {
  CustomSearchTextField({super.key, required this.txt});
  final String txt;
  final searchController = TextEditingController();
  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  @override
  Widget build(BuildContext context) {
    var newestCubit = BlocProvider.of<NewestBooksCubit>(context);
    Size device = MediaQuery.sizeOf(context);
    return SizedBox(
      height: device.height * 0.055,
      child: TextFormField(
        //    controller: widget.searchController,
        onChanged: (value) {
          setState(() {
            print("==========================");
            print(value);
            newestCubit.updateList(value: value);
          });
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.45))),
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            labelText: widget.txt),
      ),
    );
  }
}
