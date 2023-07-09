 import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/cardfriendlinks.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';
class cardfriendlink extends StatefulWidget {
  const cardfriendlink({Key? key}) : super(key: key);

  @override
  State<cardfriendlink> createState() => _cardfriendlinkState();
}

class _cardfriendlinkState extends State<cardfriendlink> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.only(left: 39,right: 38),
 child:Column(
   children: [
     cardfriendlinks( title: "Instagram",subtitle: "https://www.instagram.com/a7medhq/" ,colorcard:kLightDangerColor ,colortext: kOnLightDangerColor,),
     SizedBox(
       height: 35,
     ),
     cardfriendlinks( title: "Instagram",subtitle: "https://www.instagram.com/a7medhq/" ,colorcard:kLightPrimaryColor ,colortext: kPrimaryColor,),
     SizedBox(
       height: 35,
     ),
     cardfriendlinks( title: "Instagram",subtitle: "https://www.instagram.com/a7medhq/" ,colorcard:kLightDangerColor ,colortext: kOnLightDangerColor,),
     SizedBox(
       height: 35,
     ),
     cardfriendlinks( title: "Instagram",subtitle: "https://www.instagram.com/a7medhq/" ,colorcard:kLightPrimaryColor ,colortext: kPrimaryColor,),
     SizedBox(
       height: 35,
     ),










   ],
 )
    );
  }
}

