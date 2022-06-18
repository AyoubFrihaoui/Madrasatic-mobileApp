import 'package:flutter/material.dart';
import 'package:Madrasatic/Providers/user.dart';
import 'package:provider/provider.dart';

class DeclarationsScreen extends StatelessWidget {
  const DeclarationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text(userNotifier.email), Text(userNotifier.password)],
    )));
  }
}
