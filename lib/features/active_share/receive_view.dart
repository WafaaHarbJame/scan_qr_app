import 'package:flutter/material.dart';
import 'package:bootcamp_starter/features/active_share/appbaractive.dart';
import 'package:bootcamp_starter/features/active_share/bady_activeshar.dart';

class ReceiveView extends StatefulWidget {
  static String id = '/receiveView';
  const ReceiveView({super.key});


  @override
  _ReceiveViewState createState() => _ReceiveViewState();
}

class _ReceiveViewState extends State<ReceiveView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 47),
        child: Column(
          children: [
            appbaractive(),
            SizedBox(height: 40),
            Image.asset(
              "assets/imgs/shar.png",
              width: 120,
              height: 193,
            ),
            SizedBox(height: 34),
         badyactiveshar()


          ],
        ),
      ),


    );
  }
}
