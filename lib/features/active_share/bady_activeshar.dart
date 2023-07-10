import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';

import '../friend_profile/friend_profile.dart';

class badyactiveshar extends StatefulWidget {
  const badyactiveshar({Key? key}) : super(key: key);

  @override
  State<badyactiveshar> createState() => _badyactivesharState();
}

class _badyactivesharState extends State<badyactiveshar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 42, left: 42),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => friendprofile()));

            },
            child: Container(
              decoration: BoxDecoration(
                color: kLightPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ListTile(
                title: Text("ahmed Ali"),
                leading: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: 9),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => friendprofile()));

            },
            child: Container(
              decoration: BoxDecoration(
                color: kLightPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ListTile(
                title: Text("ahmed Ali"),
                leading: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: 9),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => friendprofile()));

            },
            child: Container(
              decoration: BoxDecoration(
                color: kLightPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ListTile(
                title: Text("ahmed Ali"),
                leading: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: 9),
        ],
      ),
    );
  }
}
