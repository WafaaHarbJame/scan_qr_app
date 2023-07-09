import 'package:bootcamp_starter/features/friend_profile/appBarFriendProfile.dart';
import 'package:bootcamp_starter/features/friend_profile/cardfriendlink.dart';
import 'package:bootcamp_starter/features/friend_profile/cardfriendprofile.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';

class friendprofile extends StatefulWidget {
  const friendprofile({Key? key}) : super(key: key);

  @override
  State<friendprofile> createState() => _friendprofileState();
}

class _friendprofileState extends State<friendprofile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,


      body:    Column(
         children: [
           AppBarfriendprofile(),
cardfriendprofile(),
           SizedBox(height: 30,),
           cardfriendlink(),
            ],
         ),


    );
  }
}

