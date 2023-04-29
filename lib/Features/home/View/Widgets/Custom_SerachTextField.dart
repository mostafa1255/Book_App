import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: outlineinputborder(),
          focusedBorder: outlineinputborder(),
          hintText: "Search",
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Opacity(
                  opacity: 0.8,
                  child: Icon(FontAwesomeIcons.magnifyingGlass, size: 27)))),
    );
  }

  OutlineInputBorder outlineinputborder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}
