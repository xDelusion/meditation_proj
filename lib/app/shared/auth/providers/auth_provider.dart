import 'package:explained_full/app/pages/auth/models/user.dart';
import 'package:explained_full/app/shared/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  User? _signedInUser;
  final authService = AuthServices();
  String token = "";

  User? get signedInUser => _signedInUser;

  Future<String> register({required User user}) async {
    token = await authService.register(user: user);

    /// token to be saved in local storage
    notifyListeners();
    return token;
  }

  Future<String> login({required User user}) async {
    token = await authService.login(user: user);
    _signedInUser = user; // Set the signed-in user.
    saveTokenInStorage(token);
    notifyListeners();
    return token;
  }

  Future<void> saveTokenInStorage(String token) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString('token', token);
  }

  Future<String> getUsernameFromToken() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString('token') ?? "";
    return token;
  }

  //readTokenFromStorage

  Future<String> readFromStorage() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString('token') ?? "";

    /// ??  null check operator
    notifyListeners();
    return token;
  }

  Future<void> logOut() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("token", '');
    token = "";
    _signedInUser = null; // Clear the signed-in user.
    saveTokenInStorage(token);
    notifyListeners();
  }
}
