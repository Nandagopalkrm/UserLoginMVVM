import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_login/model/user_model.dart';
import 'package:user_login/model_view/user_viewmodel.dart';
import 'package:user_login/repository/auth_repository.dart';
import 'package:user_login/utils/routes/routes_name.dart';
import 'package:user_login/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final myRepo = AuthRepository();
  bool loading = false;

  Future<void> loginApi(dynamic data, BuildContext context) async {
    loading = true;
    notifyListeners();
    myRepo.loginApi(data).then((value) {
      loading = false;
      notifyListeners();

      Utils().showErrorFlushbar(context, "Success", "Login Successfully");

      final usermodelViewModel =
          Provider.of<UserViewModel>(context, listen: false);

      usermodelViewModel.saveUser(UserModel(token: value.toString()));
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      loading = false;
      notifyListeners();
      print(error.toString());
      Utils().showErrorFlushbar(context, "Error", error.toString());
    });
  }
}
