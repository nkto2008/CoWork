import 'package:flutter/material.dart';

import '../utils/constants.dart';

class InputForm extends StatelessWidget {

  const InputForm({
    Key? key,
    required this.title,
    required this.placeholder,
    required this.isPass,
    required this.inputController,
  }) : super(key: key);

  final String title, placeholder;
  final bool isPass;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding/2, vertical: 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Center(
        child: TextFormField(
          controller: inputController,
          obscureText: isPass,
          style: const TextStyle(
            fontFamily: "Comfortaa",
            fontWeight: FontWeight.bold,
            color: Color(0x6F000000),
          ),
          decoration: InputDecoration(
            labelText: title,
            labelStyle: const TextStyle(color: primaryColor),
            hintText: placeholder,
            hintStyle:
            const TextStyle(color: Color(0x20000000), fontSize: 13),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}