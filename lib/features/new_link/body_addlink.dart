import 'package:bootcamp_starter/features/new_link/AddLink%20Response.dart';
import 'package:bootcamp_starter/features/profile/links/models/link_model.dart';
import 'package:bootcamp_starter/features/profile/links/providers/links_provider.dart';
import 'package:bootcamp_starter/network/api_response.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:bootcamp_starter/core/widgets/primary_outlined_button_widget.dart';
import 'package:bootcamp_starter/core/widgets/secand_Labeled_TextField_Widget.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../auth/ShPreferences.dart';
import '../auth/user_model.dart';
import '../edit_link/edit_link_provider.dart';
class bodyaddlink extends StatefulWidget {
  bodyaddlink({Key? key}) : super(key: key);

  @override
  State<bodyaddlink> createState() => _bodyaddlinkState();
}
late String title, link ;
class _bodyaddlinkState extends State<bodyaddlink> {
  User? savedUser = ShPreferences.getUser();
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  @override

  TextEditingController _textFieldControllertitle = TextEditingController();
  TextEditingController _textFieldControllerlink = TextEditingController();
  late String title , link ;
  Widget build(BuildContext context) {
    ShPreferences.init();

    return Padding(
      padding:EdgeInsets.only(top: 90,left: 43,right: 43)
      ,
      child:  Column(
        children: [
          secandLabeledTextFieldWidget(
              label: "title",
              hint: "Snapchat",
              controller: titleController,
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
              controller:linkController,
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
            onTap: () async {
              try {
                ApiResponse<AddLinkResponse> userApiResponse =
                await EditLinkProvider().addLink(
                    titleController.text,
                    linkController.text,
                    savedUser!.name??"",
                    0);
                if (userApiResponse.status == Status.LOADING) {
                } else if (userApiResponse.status == Status.COMPLETED) {
                  setState(() {
                    Fluttertoast.showToast(
                        msg: "Added successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.yellow);
                    print("Log COMPLETED status${userApiResponse.message}");
                    linkController.clear();
                    titleController.clear();

                  });



                } else if (userApiResponse.status == Status.ERROR) {
                  print("Log Error status${userApiResponse.message}");
                }
              } catch (e) {
                // An error occurred
                print('Log An error occurred: $e');
              }

            },
            width: 138,
          ),




        ],
      ),

    );
  }
}

