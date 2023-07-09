import 'package:bootcamp_starter/features/new_link/body_addlink.dart';
import 'package:flutter/material.dart';

import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';
class addlink extends StatefulWidget {
  const addlink({Key? key}) : super(key: key);

  @override
  State<addlink> createState() => _addlinkState();
}

class _addlinkState extends State<addlink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:           IconButton(onPressed: (){},
            icon: Icon(Icons.arrow_back_ios ,size: 24),
            color: kPrimaryColor),
          title:
          Text(
              "Add Link" ,
              style: TextStyle(
                color:kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,

              ),
      ),


      ),
      body: Column(
        children: [
bodyaddlink()
        ],
      ),
    );
  }
}
