import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? login() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      return "Email e senha são obrigatórios.";
    }

    if (email != "user@teste.com" && password != "123456") {
      return "Credenciais inválidas.";
    }
    return null;
  }
}
