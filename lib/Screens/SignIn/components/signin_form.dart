import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:Madrasatic/Providers/auth.dart';
import 'package:Madrasatic/Providers/user.dart';
import 'package:Madrasatic/Screens/Declarations/declarations_screen.dart';
import 'package:Madrasatic/Screens/components/background.dart';
import 'package:Madrasatic/constants.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../SignUp/signup_screen.dart';

class SignInForm extends StatelessWidget {
  SignInForm({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
            ),
            Image.asset("assets/images/Signup_illu.png", width: 280),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 5),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: const Color(0xFF6F35A5),
                controller: emailController,
                onSaved: (email) {},
                decoration: const InputDecoration(
                  hintText: "Your email",
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding,
                        top: innerPadding,
                        right: defaultPadding,
                        bottom: innerPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 5),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                controller: passwordController,
                cursorColor: const Color(0xFF6F35A5),
                decoration: const InputDecoration(
                  hintText: "Your password",
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding,
                        top: innerPadding,
                        right: defaultPadding,
                        bottom: innerPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Hero(
              tag: "login",
              child: Padding(
                padding: const EdgeInsets.only(
                    left: defaultPadding,
                    top: innerPadding,
                    right: defaultPadding,
                    bottom: innerPadding),
                child: ElevatedButton(
                  onPressed: () {
                    //userNotifier.setEmail(emailController.text);
                    //userNotifier.setPassword(passwordController.text);
                    Provider.of<UserNotifier>(context, listen: false)
                        .setEmail(emailController.text);
                    Provider.of<UserNotifier>(context, listen: false)
                        .setPassword(passwordController.text);
                    Auth()
                        .SignIn(emailController.text, passwordController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const DeclarationsScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Login".toUpperCase(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ]),
    );
  }
}
