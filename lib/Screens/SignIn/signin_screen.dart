import 'package:flutter/material.dart';
import 'package:Madrasatic/Screens/SignIn/components/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInForm(),
    );
  }
}
