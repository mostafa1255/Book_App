import 'package:booklyapp/core/Styles.dart';
import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({super.key, required this.errmessage});
  final String errmessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$errmessage",
        textAlign: TextAlign.center,
        style: Styles.textStyle18,
      ),
    );
  }
}
