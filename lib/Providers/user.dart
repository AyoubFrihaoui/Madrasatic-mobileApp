import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class User {
  static const HI = {
    "id": 6,
    "last_login": null,
    "is_superuser": false,
    "first_name": "",
    "is_staff": false,
    "is_active": true,
    "date_joined": "2022-06-16T10:27:38.595185Z",
    "name": "ayoub",
    "email": "aaa.frihaoui@esi-sba.dz",
    "is_verified": false,
    "username": null,
    "last_name": null,
    "picture": null,
    "groups": [],
    "user_permissions": []
  };
  final int id;
  final bool is_superuser;
  final String first_name;
  final String last_name;
  final String user_name;
  final String date_joined;
  final String email;
  final Picture picture;

  User(this.id, this.is_superuser, this.first_name, this.last_name,
      this.user_name, this.date_joined, this.email, this.picture);
}

class UserNotifier extends ChangeNotifier {
  late int id;
  late bool is_superuser;
  late String first_name;
  late String last_name;
  late String user_name;
  late String date_joined;
  late String email;
  late String password;
  late Picture picture;

  //UserNotifier(this.id, this.is_superuser, this.first_name, this.last_name,
  //  this.user_name, this.date_joined, this.email, this.picture);

  void setId(int id) {
    this.id = id;
    notifyListeners();
  }

  void setUserName(String user_name) {
    this.user_name = user_name;
    notifyListeners();
  }

  void setFirstName(String first_name) {
    this.first_name = first_name;
    notifyListeners();
  }

  void setLastName(String last_name) {
    this.last_name = last_name;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  void setPicture(Picture picture) {
    this.picture = picture;
    notifyListeners();
  }
}
