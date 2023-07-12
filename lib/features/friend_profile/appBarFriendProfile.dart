import 'package:bootcamp_starter/features/active_share/NearstSharingResponse.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';

class AppBarfriendprofile extends StatefulWidget {

  AppBarfriendprofile({Key? key}) : super(key: key);

  @override
  State<AppBarfriendprofile> createState() => _AppBarfriendprofileState();
}

class _AppBarfriendprofileState extends State<AppBarfriendprofile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 24),
            color: kPrimaryColor,
          ),
          SizedBox(
            width: 78.5,
          ),
          Center(
            child: Text(
              "vfvf",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}