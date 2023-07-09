import 'package:bootcamp_starter/features/new_link/body_addlink.dart';
import 'package:flutter/material.dart';

import 'package:bootcamp_starter/core/util/constants.dart';

class AddLinkView extends StatefulWidget {
  static String id = '/addLinkView';

  const AddLinkView({Key? key}) : super(key: key);

  @override
  State<AddLinkView> createState() => _AddLinkViewState();
}

class _AddLinkViewState extends State<AddLinkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 24),
            color: kPrimaryColor),
        title: const Text(
          "Add Link",
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: const Column(
        children: [bodyaddlink()],
      ),
    );
  }
}
