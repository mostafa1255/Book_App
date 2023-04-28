import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'Custom_Bookdetails_AppBar.dart';
import 'Custom_List_Item.dart';
import 'Featured_List_View.dart';

class BookdetailsViewBody extends StatelessWidget {
  const BookdetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
      child: Column(
        children: [
          const CustomBookdetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.19),
            child: const CustomBookImage(),
          )
        ],
      ),
    );
  }
}
