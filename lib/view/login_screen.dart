import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:user_login/model_view/auth_viewmodel.dart';
import 'package:user_login/resources/components/rounded_button.dart';
import 'package:user_login/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final ValueNotifier<bool> obscurbText = ValueNotifier<bool>(true);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  hintStyle: TextStyle(color: AppColors.hintTextStyleColor),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.iconColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onFieldSubmitted: (value) {
                  Utils().onChangedFocusNode(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                valueListenable: obscurbText,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: obscurbText.value,
                    obscuringCharacter: "*",
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        hintStyle:
                            TextStyle(color: AppColors.hintTextStyleColor),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColors.iconColor,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            obscurbText.value = !obscurbText.value;
                          },
                          child: Icon(
                            obscurbText.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.iconColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Consumer<AuthViewModel>(
                builder: (context, authViewModel, child) {
                  return RoundedButton(
                    title: "Login",
                    onPress: () {
                      if (emailController.text.isEmpty) {
                        Utils().showErrorFlushbar(context, "Email is required",
                            "Please Enter Valid Email");
                      } else if (passwordController.text.isEmpty) {
                        Utils().showErrorFlushbar(
                            context,
                            "Password is required",
                            "Please Enter Correct Password");
                      } else if (passwordController.text.length < 6) {
                        Utils().showErrorFlushbar(context, "Length!",
                            "Password should be greater than 6 ");
                      } else {
                        Map data = {
                          "email": emailController.text.toString(),
                          "password": passwordController.toString(),
                        };
                        authViewModel.loginApi(data, context);
                      }
                    },
                  );
                },
              )
            ],
          ),
        ));
  }
}
