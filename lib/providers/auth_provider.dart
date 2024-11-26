import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodiez_frontend/models/user.dart';
import 'package:foodiez_frontend/services/auth.dart';
import 'package:foodiez_frontend/services/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String token = ""; //"error", "email", "token"
  User? user;

  Future<String> signup({required String username, required String password}) async {
    token = await AuthServices().signup(user: User(username: username, password: password));
    //_setToken();
    //print(token);
    notifyListeners();
    return token;
  }

  Future<void> signin({required String username, required String password}) async {
    token = await AuthServices().signin(user: User(username: username, password: password));
    //this.user = user;
    _setToken(token[1], token[2]);
    //print(token);
    user = User(username: username, password: password);
    notifyListeners();
  }

  bool isAuth() {
    return (user != null && token[0].isEmpty);
  }

  Future<void> initAuth() async {
    await _getToken();
    if (isAuth()) {
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: 'Bearer ${token[2]}',
      };
      user = User(username: token[1], password: token[2]);
      print('Bearer $token');
      notifyListeners();
    }
  }

  void _setToken(String email, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    prefs.setString("token", token);
    notifyListeners();
  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString("email");
    var token = prefs.getString("token");

    if (email == null || token == null) return;

    user = User(username: email, password: token);
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('token');
    user = null;
    notifyListeners();
  }
}
