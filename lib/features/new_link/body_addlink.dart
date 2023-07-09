import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:bootcamp_starter/core/widgets/primary_outlined_button_widget.dart';
import 'package:bootcamp_starter/core/widgets/secand_Labeled_TextField_Widget.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';
class bodyaddlink extends StatefulWidget {
  const bodyaddlink({Key? key}) : super(key: key);

  @override
  State<bodyaddlink> createState() => _bodyaddlinkState();
}

class _bodyaddlinkState extends State<bodyaddlink> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.only(top: 90,left: 43,right: 43)
            ,
      child: Column(
        children: [
          secandLabeledTextFieldWidget(label: "title",hint: "Snapchat",),
          SizedBox(
            height: 13,
          ),
          secandLabeledTextFieldWidget(label: "link",hint: "http:\\www.Example.com",),
          SizedBox(
            height: 52,
          ),
          SecondaryButtonWidget(text: "ADD",onTap: (){},width: 138,)
        ],
      ),

    );
  }
}
