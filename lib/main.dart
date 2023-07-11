import 'package:bootcamp_starter/features/active_share/receive_view.dart';
import 'package:bootcamp_starter/features/auth/login_provider.dart';
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/home/home_view.dart';
import 'package:bootcamp_starter/features/main_app/main_app_view.dart';
import 'package:bootcamp_starter/features/onbording/onbording_view.dart';
import 'package:bootcamp_starter/features/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/util/constants.dart';
import 'features/profile/links/providers/links_provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await UserPreferences.init();
  SharedPreferences.setMockInitialValues({});


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     // Initialize UserPreferences
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LinkProvider>(
          create: (_) => LinkProvider(),
        ),

        // ChangeNotifierProvider<LoginProvider>(
        //   create: (_) => LoginProvider(),
        // ),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Betweener',
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: kPrimaryColor,
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
            scaffoldBackgroundColor: kScaffoldColor),
        home: const OnBoardingView(),
        routes: {
          LoginView.id: (context) => LoginView(),
          RegisterView.id: (context) => RegisterView(),
          HomeView.id: (context) => const HomeView(),
          MainAppView.id: (context) => const MainAppView(),
          ProfileView.id: (context) => const ProfileView(),
          ReceiveView.id: (context) => const ReceiveView(),
        },
      )

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Betweener',
    //   theme: ThemeData(
    //       useMaterial3: true,
    //       colorSchemeSeed: kPrimaryColor,
    //       appBarTheme: const AppBarTheme(
    //         titleTextStyle: TextStyle(
    //             fontSize: 24,
    //             fontWeight: FontWeight.bold,
    //             color: kPrimaryColor),
    //       ),
    //       scaffoldBackgroundColor: kScaffoldColor),
    //   home: const OnBoardingView(),
    //   routes: {
    //     LoginView.id: (context) => LoginView(),
    //     RegisterView.id: (context) => RegisterView(),
    //     HomeView.id: (context) => const HomeView(),
    //     MainAppView.id: (context) => const MainAppView(),
    //     ProfileView2.id: (context) => const ProfileView(),
    //     ReceiveView.id: (context) => const ReceiveView(),
    //   },
    // );
    );
  }
}
