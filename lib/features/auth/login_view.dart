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
import 'UserPreferences.dart';
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

  @override
  Widget build(BuildContext context) {
    ShPreferences.init();

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
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
                hint: 'example@gmail.com',
                keyboardType: TextInputType.emailAddress,
                label: 'Email',
              ),
              const SizedBox(
                height: 14,
              ),
              PrimaryLabeledTextFieldWidget(
                controller: passwordController,
                hint: 'Enter password',
                label: 'password',
                password: true,
              ),
              const SizedBox(
                height: 24,
              ),
              SecondaryButtonWidget(
                  onTap: () async {

                    // if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                      print("Log empty data");
                      try {
                        ApiResponse<User> userApiResponse = await LoginProvider()
                            .loginUser(
                            emailController.text, passwordController.text);
                        if (userApiResponse.status == Status.LOADING) {
                          return const CircularProgressIndicator(
                            color: Colors.blue,
                          );
                        } else if (userApiResponse.status == Status.COMPLETED) {
                          Navigator.pushNamed(context, MainAppView.id);
                        } else if (userApiResponse.status == Status.ERROR) {
                          AlertDialog(
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
                      } catch (e) {
                        // An error occurred
                        print('Log An error occurred: $e');
                      }

                 //   }
                 //    else{
                 //      AlertDialog(
                 //        title: const Text('Login'),
                 //        content: const SingleChildScrollView(
                 //          child: ListBody(
                 //            children: <Widget>[
                 //              Text('Data empty'),
                 //            ],
                 //          ),
                 //        ),
                 //        actions: <Widget>[
                 //          TextButton(
                 //            child: const Text('ok'),
                 //            onPressed: () {
                 //              Navigator.of(context).pop();
                 //            },
                 //          ),
                 //        ],
                 //      );
                 //    }
                    // makeLoginRequest1(context);
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
    ));
  }
}

// Future<void> makeLoginRequest1(context) async {
//   try {
//     ApiResponse<User> userApiResponse = await LoginProvider().loginUser(email);
//     if (userApiResponse.status == Status.LOADING) {
//     } else if (userApiResponse.status == Status.COMPLETED) {
//       Navigator.pushNamed(context, MainAppView.id);
//     } else if (userApiResponse.status == Status.ERROR) {
//       AlertDialog(
//         title: const Text('AlertDialog Title'),
//         content: const SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text('Login'),
//               Text('Login Error'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('ok'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     }
//   } catch (e) {
//     // An error occurred
//     print('Log An error occurred: $e');
//   }
// }
