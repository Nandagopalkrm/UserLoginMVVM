import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color hintTextStyleColor = Colors.deepPurple;
  static Color iconColor = Colors.deepPurple;
  static Color buttonColor = Colors.deepPurple;
  static Color buttonTextColor = Colors.white;
  static Color flushBarColor = Colors.red;
}

class Utils {
  void onChangedFocusNode(
      BuildContext context, currentFocusNode, nextFocusNode) {
    currentFocusNode.unfocus;

    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  void showErrorFlushbar(BuildContext context, String title, String message) {
    Flushbar(
      title: title,
      message: message,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      padding: EdgeInsets.all(15),
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: AppColors.flushBarColor,
      positionOffset: 20,
      borderRadius: BorderRadius.circular(10),
      icon: Icon(Icons.error_outline),
    ).show(context);
  }
}
