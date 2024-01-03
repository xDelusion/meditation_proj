import 'package:explained_full/app/pages/auth/models/user.dart';
import 'package:explained_full/app/pages/auth/login/components/login_header.dart';
import 'package:explained_full/app/pages/auth/login/components/register_rich_text.dart';
import 'package:explained_full/app/pages/auth/login/components/password_text_field.dart';
import 'package:explained_full/app/pages/auth/login/components/username_text_field.dart';
import 'package:explained_full/app/shared/auth/providers/auth_provider.dart';
import 'package:explained_full/app/shared/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(),
            MyTextField(
                controller: _usernameController,
                label: 'Username or Email',
                hint: 'Enter Username or Email'),
            PasswordTextField(
              controller: _passwordController,
            ),
            SizedBox(height: 17),
            RegisterRichText(),
            SizedBox(height: 17),
            ElevatedButton(
              onPressed: () {
                final User user = User(
                    username: _usernameController.text,
                    password: _passwordController.text);
                context.read<AuthProvider>().login(user: user).then((token) {
                  if (token.isNotEmpty) {
                    context.push("/");
                  }
                });
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
