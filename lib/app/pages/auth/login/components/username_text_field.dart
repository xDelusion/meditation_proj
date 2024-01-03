import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      required this.label,
      required this.hint,
      this.obscureText,
      this.obscuringCharacter,
      required this.controller});

  final String label;
  final String hint;
  final bool? obscureText;
  final String? obscuringCharacter;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 25, right: 25),
        child: TextField(
          controller: controller,
          // obscureText: obscureText,
          decoration: InputDecoration(
            filled: false,
            fillColor: Colors.tealAccent,
            border: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(22))),
            labelText: label,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
