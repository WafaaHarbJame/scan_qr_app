import 'package:bootcamp_starter/features/active_share/providers/active_share_provider.dart';
import 'package:bootcamp_starter/features/active_share/receive_view.dart';
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/home/home_view.dart';
import 'package:bootcamp_starter/features/main_app/main_app_view.dart';
import 'package:bootcamp_starter/features/onbording/onbording_view.dart';
import 'package:bootcamp_starter/features/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/util/constants.dart';
import 'features/auth/ShPreferences.dart';
import 'features/profile/links/providers/links_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ShPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});
  bool isUserLoggedIn = false; // Assuming initially the user is not logged in

  @override
  Widget build(BuildContext context) {
    ShPreferences.init();
    isUserLoggedIn = ShPreferences.getUser() != null;


    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LinkProvider>(
            create: (_) => LinkProvider(),
          ),
          ChangeNotifierProvider<ActiveSharingProvider>(
            create: (_) => ActiveSharingProvider(),
          )
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

          home: isUserLoggedIn ? const MainAppView() : const OnBoardingView(),
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
