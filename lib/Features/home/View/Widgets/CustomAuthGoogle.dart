import 'package:flutter/material.dart';

import '../../Presentation/Manager/Auth_Cubit/auth_cubit.dart';

// ignore: must_be_immutable
class CustomAuthGoogle extends StatelessWidget {
  CustomAuthGoogle(
      {super.key,
      required this.googleonPressed,
      required this.device,
      required this.authcubit});

  void Function()? googleonPressed;
  final Size device;
  final AuthCubit authcubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: device.width * 0.17,
          height: device.height * 0.08,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          child: IconButton(
            onPressed: googleonPressed,
            icon: Image.asset("assets/images/google.png"),
            iconSize: 35,
          ),
        ),
      ],
    );
  }
}
