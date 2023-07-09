import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
class appbaraddlink extends StatefulWidget {
  const appbaraddlink({Key? key}) : super(key: key);

  @override
  State<appbaraddlink> createState() => _appbaraddlinkState();
}

class _appbaraddlinkState extends State<appbaraddlink> {
  @override
  Widget build(BuildContext context) {


   return Padding(
      padding: const EdgeInsets.only(top: 38),
      child:   Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          IconButton(onPressed: (){},
              icon: Icon(Icons.arrow_back_ios ,size: 24),
              color: kPrimaryColor),
          Center(
            child: Text(
              "Add Link" ,
              style: TextStyle(
                color:kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,

              ),),
          )



        ],

      ),


    );
  }
}