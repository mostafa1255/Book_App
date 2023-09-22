import 'package:booklyapp/core/utils/Function/Launch_Url.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/Custom_Button.dart';
import '../../../data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomButton(
            fontSize: 18,
            text: "Free",
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
          ),
        ),
        Expanded(
          child: CustomButton(
              onPressed: () async {
                //  Uri url = Uri.parse(bookModel.volumeInfo.previewLink!);
                LauchCustomUrl(context, bookModel.volumeInfo.previewLink!);
              },
              fontSize: 15,
              text: getText(bookModel),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12))),
        ),
      ],
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not Avaliable";
    } else {
      return "Preview";
    }
  }
}
