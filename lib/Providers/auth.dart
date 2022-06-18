import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants.dart';

class Auth {
  Auth();
  static String token = "0";
  Map<String, String> headerss = {};

  Future<void> SignUp(
    String name,
    String email,
    String password,
  ) async {
    var url = '$domain/register';

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    jsonDecode(response.body);

    if (response.statusCode < 300) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(response.body);
      //Register.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.body);
      throw Exception(response.body);
    }
  }

  Future<void> SignIn(
    String email,
    String password,
  ) async {
    var url = '$domain/login';

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    updateCookie(response);
    //updateCookie(response);

    Map<String, dynamic> res = jsonDecode(response.body);

    if (response.statusCode < 300) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(response.headers);
      print(response.body);
      print(res["jwt"]);
      token = res["jwt"].toString();
      this.user();
      //Register.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.body);
      throw Exception(response.body);
    }
  }

  Future<void> user() async {
    var url = '$domain/user';

    final response = await http.get(Uri.parse(url), headers: headerss);

    Map<String, dynamic> res = jsonDecode(response.body);

    if (response.statusCode < 300) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(response.body);
      print(res["email"]);
      //Register.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.body);
      print(token);
      throw Exception(response.body);
    }
  }

  void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headerss['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}
