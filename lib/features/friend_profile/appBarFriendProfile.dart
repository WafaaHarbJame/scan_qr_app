import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';

class AppBarfriendprofile extends StatefulWidget {
  const AppBarfriendprofile({Key? key}) : super(key: key);

  @override
  State<AppBarfriendprofile> createState() => _AppBarfriendprofileState();
}

class _AppBarfriendprofileState extends State<AppBarfriendprofile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38),
      child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios, size: 24),
              color: kPrimaryColor),
          SizedBox(
            width: 78.5,
          ),
          Center(
            child: Text(
              "Ahmed Ali",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
