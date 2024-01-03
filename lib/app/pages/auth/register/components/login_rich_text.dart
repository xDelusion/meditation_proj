import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginRichText extends StatelessWidget {
  const LoginRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: RichText(
        text: TextSpan(
            text: 'Already a user? ',
            style: TextStyle(fontSize: 15, color: Colors.black),
            children: [
              TextSpan(
                  text: 'Login',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.go('/login');
                    },
                  style: TextStyle(color: Colors.blue))
            ]),
      ),
    );
  }
}
