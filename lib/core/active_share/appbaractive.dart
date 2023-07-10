import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';
class appbaractive extends StatelessWidget {
  const appbaractive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             Center(
      child: text_style(
        text: "Active Sharing",
        color: kPrimaryColor,
        fontWeight: FontWeight.w600,
      ),
    );

  }
}
