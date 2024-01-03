import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 25, right: 25),
        child: TextField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            filled: false,
            fillColor: Colors.tealAccent,
            border: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(22))),
            labelText: 'Password',
            hintText: 'Enter Password',
          ),
        ),
      ),
    );
  }
}
