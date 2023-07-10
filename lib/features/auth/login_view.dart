import 'dart:convert';

import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:bootcamp_starter/core/widgets/primary_outlined_button_widget.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../network/api_base_helper.dart';
import '../main_app/main_app_view.dart';
import 'widgets/google_button_widget.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatelessWidget {
  static String id = '/loginView';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onTap: () {
                      makeLoginRequest(context);
                      // Consumer<LoginProvider>(builder: (_, linkProvider, __) {
                      //   if (linkProvider.user.status == Status.LOADING) {
                      //     return const Center(
                      //       child: CircularProgressIndicator(),
                      //     );
                      //   }
                      //   if (linkProvider.user.status == Status.ERROR) {
                      //     return Center(
                      //       child: Text('${linkProvider.user.message}'),
                      //     );
                      //   }
                      //   print("Log Name ${linkProvider.user.data!.name}");
                      //   return Text("Name ${linkProvider.user.data!.name}");
                      // });
                      // Navigator.pushNamed(context, MainAppView.id);
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
    );
  }
}


Future<void> makeLoginRequest(BuildContext context) async {
  try {
    final url = Uri.parse('http://osamapro.online/api/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': 'a@gmail.com', 'password': '123456'});

    // final ApiBaseHelper _helper = ApiBaseHelper();
    // final response = await http.post("/login", {'email' : 'a@gmail.com','password' : '123456'}, {});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Request successful
      final responseBody = jsonDecode(response.body);
      final user = User.fromJson(responseBody['user']);
      print('User ID: ${user.id}');
      // Navigator.pushNamed(context, MainAppView.id);


    }
  } catch (e) {
    // An error occurred
    print('Log An error occurred: $e');
  }
}






