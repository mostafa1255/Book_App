import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.device,
    required this.hinttext,
    required this.SecurPass,
    required this.stringController,
  });
  final bool SecurPass;
  final TextEditingController stringController;
  final Size device;
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: device.height * 0.1,
      width: device.width * 0.88,
      child: TextFormField(
        controller: stringController,
        obscureText: SecurPass,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hinttext,
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
