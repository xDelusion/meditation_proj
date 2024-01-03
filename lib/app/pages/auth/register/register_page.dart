import 'package:explained_full/app/pages/auth/models/user.dart';
import 'package:explained_full/app/pages/auth/login/components/password_text_field.dart';
import 'package:explained_full/app/pages/auth/login/components/username_text_field.dart';
import 'package:explained_full/app/pages/auth/register/components/login_rich_text.dart';
import 'package:explained_full/app/shared/auth/providers/auth_provider.dart';
import 'package:explained_full/app/shared/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/login.png',
                  scale: 40,
                ),
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'ROUNDED',
                  ),
                ),
                MyTextField(
                    controller: _usernameController,
                    label: 'Username',
                    hint: 'Enter Username'),
                PasswordTextField(
                  controller: _passwordController,
                ),
                LoginRichText(),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_usernameController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      final User user = User(
                        username: _usernameController.text,
                        password: _passwordController.text,
                      );
                      context
                          .read<AuthProvider>()
                          .register(user: user)
                          .then((token) {
                        if (token.isNotEmpty) {
                          // Registration successful, navigate to login screen
                          context.push("/");
                        }
                      });
                    } else {
                      // Show an error message or handle the case where fields are empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Please fill in both username and password.'),
                        ),
                      );
                    }
                  },
                  child: const Text("Register"),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
