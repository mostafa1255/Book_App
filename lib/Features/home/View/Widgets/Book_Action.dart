import 'package:booklyapp/core/utils/Function/Launch_Url.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/Custom_Button.dart';
import '../../../data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.sizeOf(context);

    return Row(
      children: [
        Expanded(
          child: CustomButton(
            fontSize: device.width * 0.053,
            text: "Free",
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
          ),
        ),
        Expanded(
          child: CustomButton(
              onPressed: () async {
                LauchCustomUrl(context, bookModel.volumeInfo.previewLink!);
              },
              fontSize: device.width * 0.047,
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
