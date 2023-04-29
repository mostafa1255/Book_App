import 'package:booklyapp/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/assets.dart';

class Custom_AppBar extends StatelessWidget {
  const Custom_AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AssetsData.Logo,
          height: 20,
          width: 80,
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(Approuter.searchview);
          },
          icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 27),
        )
      ],
    );
  }
}
