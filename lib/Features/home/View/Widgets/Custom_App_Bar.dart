import 'package:booklyapp/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/assets.dart';

class Custom_AppBar extends StatelessWidget {
  const Custom_AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.sizeOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AssetsData.Logo,
          height: device.height * 0.07,
          width: device.width * 0.25,
        ),
        IconButton(
            onPressed: () {
              GoRouter.of(context).push(Approuter.profilesettingsscreen);
            },
            icon: const Icon(Icons.account_circle)),
      ],
    );
  }
}
