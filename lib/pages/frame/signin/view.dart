import 'package:chatty/pages/frame/welcome/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<WelcomeController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sign In'),
      ),
    );
  }
}
