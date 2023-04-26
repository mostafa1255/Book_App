import 'package:booklyapp/View/Screens/Splash_View.dart';
import 'package:booklyapp/core/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor,
      textTheme:GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme) ),
      debugShowCheckedModeBanner: false,
      
      home: const SplashView(),
    );
  }
}
