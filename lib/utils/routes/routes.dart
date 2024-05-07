import 'package:flutter/material.dart';
import 'package:user_login/utils/routes/routes_name.dart';
import 'package:user_login/view/home_screen.dart';
import 'package:user_login/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No Routes Defined"),
              ),
            );
          },
        );
    }
  }
}
