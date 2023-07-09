import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';
class cardfriendlinks extends StatelessWidget {
final Color colorcard;
final Color colortext;

cardfriendlinks({
  required this.colorcard,
  required this.colortext,
  required this.title,
  required this.subtitle});

  final String title ;
final String subtitle ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 58,
          decoration: BoxDecoration(
              color: colorcard,
              borderRadius: BorderRadius.circular(15)
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13,top: 11),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text_style(
                text: title,
                //"Instagram",
                color: colortext,
                size: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 5,
              )
              ,   text_style(
                   text:subtitle,
                // "https://www.instagram.com/a7medhq/",
                  color: colortext,
                  size: 14,
                  fontWeight: FontWeight.w400)
            ],
          ),
        ),
      ],
    );
  }
}
