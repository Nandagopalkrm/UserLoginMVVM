import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_login/model/user_model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sharedPrferences =
        await SharedPreferences.getInstance();
    sharedPrferences.setString("token", user.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sharedPrferences =
        await SharedPreferences.getInstance();
    String? token = sharedPrferences.getString("token");
    return UserModel(token: token);
  }

  Future<bool> removeUser() async {
    final SharedPreferences sharedPrferences =
        await SharedPreferences.getInstance();
    sharedPrferences.remove("token");
    sharedPrferences.clear();
    return true;
  }
}
