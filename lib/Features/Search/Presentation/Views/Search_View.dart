import 'package:flutter/material.dart';
import '../../../home/View/Widgets/Search_View_Body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: SearchViewBody(),
      ),
    );
  }
}
