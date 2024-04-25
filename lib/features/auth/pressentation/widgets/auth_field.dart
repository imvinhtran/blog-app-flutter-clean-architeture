import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool isObscureText;

  const AuthField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    required this.isObscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscureText,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
