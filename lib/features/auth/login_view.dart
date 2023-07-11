import 'dart:convert';

import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:bootcamp_starter/core/widgets/primary_outlined_button_widget.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:bootcamp_starter/features/auth/login_provider.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../network/api_response.dart';
import '../main_app/main_app_view.dart';
import 'ShPreferences.dart';
import 'widgets/google_button_widget.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatefulWidget {
  static String id = '/loginView';

  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ShPreferences.init();

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Hero(
                        tag: 'authImage',
                        child: SvgPicture.asset(AssetsData.authImage))),
                const Spacer(),
                PrimaryLabeledTextFieldWidget(
                  controller: emailController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Enter user name!";
                    }
                    return null;
                  },
                  hint: 'example@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  label: 'Email',
                ),
                const SizedBox(
                  height: 14,
                ),
                PrimaryLabeledTextFieldWidget(
                  controller: passwordController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Enter Password!";
                    }
                    return null;
                  },
                  hint: 'Enter password',
                  label: 'password',
                  password: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                SecondaryButtonWidget(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        try {
                          ApiResponse<User> userApiResponse =
                          await LoginProvider().loginUser(
                              emailController.text,
                              passwordController.text);
                          if (userApiResponse.status == Status.LOADING) {
                            return const CircularProgressIndicator(
                              color: Colors.blue,
                            );
                          } else if (userApiResponse.status == Status.COMPLETED) {
                            Navigator.pushNamed(context, MainAppView.id);
                          } else if (userApiResponse.status == Status.ERROR) {
                            print("Error status");
                          }
                        } catch (e) {
                          // An error occurred
                          print('Log An error occurred: $e');
                        }
                      } else {
                        debugPrint("Name is ${emailController.text}");
                        debugPrint("password is ${passwordController.text}");
                      }
                    },
                    text: 'LOGIN'),
                const SizedBox(
                  height: 24,
                ),
                PrimaryOutlinedButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterView.id);
                    },
                    text: 'REGISTER'),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  '-  or  -',
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 12,
                ),
                GoogleButtonWidget(onTap: () {}),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class ShowAlert extends StatelessWidget {
  const ShowAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Login'),
            Text('Login Error'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
