import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:Madrasatic/Providers/auth.dart';
import 'package:Madrasatic/Screens/SignIn/signin_screen.dart';
import 'package:Madrasatic/Screens/components/background.dart';
import 'package:Madrasatic/constants.dart';
import 'package:http/http.dart';

import '../../../components/already_have_an_account_acheck.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          const Text(
            "SIGN UP",
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
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "First name",
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
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: const Color(0xFF6F35A5),
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
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 5),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: const Color(0xFF6F35A5),
              decoration: const InputDecoration(
                hintText: "Reenter your password",
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
              child: Center(
                child: ElevatedButton(
                  onPressed: () =>
                      Auth().SignUp("ayoub", "aaa.frihaoui@esi-sba.dz", "123"),
                  child: Text(
                    "Sign Up".toUpperCase(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignInScreen();
                  },
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
