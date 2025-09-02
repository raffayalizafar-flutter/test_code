import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testcode/core/constants/font_const.dart';
import 'package:testcode/core/constants/padding_const.dart';
import 'package:testcode/services/login_service.dart';
import 'package:testcode/widgets/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login Page",
              style: FontConst.getBoldContent(context).copyWith(fontSize: 36),
            ),
            Text("User: test\nPassword: 1234", style: FontConst.smallLightText),
            CustomCupertinoField(
              aboveSpacing: PaddingConst.itemSpacing,
              controller: usernameController,
              labelText: "Username",
            ),
            CustomCupertinoField(
              aboveSpacing: PaddingConst.itemSpacing,
              controller: passwordController,
              labelText: "Password",
            ),
            CupertinoButton.filled(
              onPressed: () {
                LoginService.login(
                  usernameController.text.trim(),
                  passwordController.text.trim(),
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
