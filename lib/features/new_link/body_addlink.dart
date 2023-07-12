import 'package:bootcamp_starter/features/profile/links/models/link_model.dart';
import 'package:bootcamp_starter/features/profile/links/providers/links_provider.dart';
import 'package:bootcamp_starter/network/api_response.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:bootcamp_starter/core/widgets/primary_outlined_button_widget.dart';
import 'package:bootcamp_starter/core/widgets/secand_Labeled_TextField_Widget.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';
import 'package:provider/provider.dart';
class bodyaddlink extends StatefulWidget {
  const bodyaddlink({Key? key}) : super(key: key);

  @override
  State<bodyaddlink> createState() => _bodyaddlinkState();
}
 late String title, link ;
class _bodyaddlinkState extends State<bodyaddlink> {
  @override

  TextEditingController _textFieldControllertitle = TextEditingController();
  TextEditingController _textFieldControllerlink = TextEditingController();
late String title , link ;
  Widget build(BuildContext context) {
    return Padding(
          padding:EdgeInsets.only(top: 90,left: 43,right: 43)
              ,
        child:  Column(
            children: [
              secandLabeledTextFieldWidget(
                  label: "title",
                  hint: "Snapchat",
                  controller: _textFieldControllertitle,
                  onChanged:(data){
                    title=data;
                  }

                  ),
              SizedBox(
                height: 13,
              ),
              secandLabeledTextFieldWidget(
                label: "link",
                hint: "http:\\www.Example.com",
                controller:_textFieldControllerlink,
                  onChanged:(data){
                    link=data;
                  }
              ),
              SizedBox(
                height: 52,
              ),
          // SecondaryButtonWidget(text: "ADD",onTap: () {
          //   String enteredValue = _textFieldControllertitle.text;
          //   String enteredValuetwo = _textFieldControllerlink.text;
          //
          //   print('Entered value: $enteredValue');
          //   print('Entered value: $enteredValuetwo');
          //
          //
          //   // Clear the text fields
          //   _textFieldControllertitle.clear();
          //   _textFieldControllerlink.clear();
          // }
          //   ,width: 138,),
              SecondaryButtonWidget(
                text: "ADD",
                onTap: () {
                  String enteredValue = _textFieldControllertitle.text;
                  String enteredValuetwo = _textFieldControllerlink.text;

                  Provider.of<LinkProvider>(context, listen: false).addLink();

                  _textFieldControllertitle.clear();
                   AddLink(title: title!, link: link!);

                  _textFieldControllerlink.clear();
                },
                width: 138,
              ),




            ],
          ),

    );
  }
}

