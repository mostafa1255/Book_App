import 'package:flutter/cupertino.dart';
import '../../../../core/Styles.dart';
import 'Similar_Books.dart';

class SimilarBooksSections extends StatelessWidget {
  const SimilarBooksSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
