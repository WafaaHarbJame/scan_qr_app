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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 47),
          child: Column(
            children: [
              appbaractive(),
              SizedBox(height: 10),
              Image.asset(
                "assets/imgs/shar.png",
                width: 100,
                height: 100,
              ),
              SizedBox(height: 10),
              badyactiveshar(),
            ],
          ),
        ),
      ),
    );
  }
}
