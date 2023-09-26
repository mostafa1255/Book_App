import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromARGB(255, 11, 17, 72);
const KGtSectorFine = "Merriweather";

class constants {
  static String? userUid;
  static String? googlename;
  static String? googleemail;
  
  static Future<void> customsnackBar(
      BuildContext context, String messgae, Color color) {
    return Future.delayed(const Duration(seconds: 1), () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(messgae),
        backgroundColor: color,
      ));
    });
  }
}
