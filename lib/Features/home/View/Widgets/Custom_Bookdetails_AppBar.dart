import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';

class CustomBookdetailsAppBar extends StatelessWidget {
  const CustomBookdetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.close)),
        IconButton(
            onPressed: () {
              GoRouter.of(context).push(Approuter.profilesettingsscreen);
            },
            icon: const Icon(Icons.account_circle)),
      ],
    );
  }
}
