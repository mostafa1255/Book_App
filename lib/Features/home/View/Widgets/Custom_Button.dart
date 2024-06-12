import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  const Custom_Button({
    super.key,
    required this.device,
    required this.txt,
    this.onPressed,
  });

  final Size device;
  final String txt;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll<Size>(
              Size(device.width, device.height * 0.04)),
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
        ),
        onPressed: onPressed,
        child: Text(
          txt,
          style: TextStyle(color: Colors.white),
        ));
  }
}
