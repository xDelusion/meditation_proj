import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterRichText extends StatelessWidget {
  const RegisterRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 0),
        child: RichText(
            text: TextSpan(
                text: 'Not a user? ',
                style: TextStyle(fontSize: 15, color: Colors.black),
                children: [
              TextSpan(
                  text: 'Register',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.go('/register');
                    },
                  style: TextStyle(color: Colors.blue))
            ])));
  }
}
