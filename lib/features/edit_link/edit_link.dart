import 'package:bootcamp_starter/features/edit_link/EditLink.dart';
import 'package:bootcamp_starter/features/edit_link/edit_link_provider.dart';
import 'package:bootcamp_starter/features/profile/links/models/link_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../network/api_base_helper.dart'; // Import the helper class for API requests
import '../../network/api_response.dart';
import '../auth/ShPreferences.dart';
import '../auth/UserRepository.dart';
import '../auth/user_model.dart';

class edit_link extends StatefulWidget {
  final Link? itemData;
  edit_link({required this.itemData});


  @override
  State<StatefulWidget> createState() {
    print('Log itemData $itemData');

    return _edit_linkState(itemData);
  }
}

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return const OutlineInputBorder(
    //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ));
}

OutlineInputBorder myfocusborder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ));
}

class _edit_linkState extends State<edit_link> {
  var name = "Text";
  String userName = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  var itemSelected;

  User? savedUser = ShPreferences.getUser();
  Link? itemData;

  _edit_linkState(this.itemData);
  @override
  void initState() {
    super.initState();
    // Initialize the text field controllers with the data from itemData
    titleController.text = itemData?.title ?? '';
    linkController.text = itemData?.link ?? '';
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(213, 231, 229, 241),
        centerTitle: false, // Set this to false to align the title to the left
        // ignore: prefer_const_constructors
        title: Text(
          "Edit",
          style: const TextStyle(color: Colors.black),
          textAlign: TextAlign.start, // Align the text to start (left)
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50),
        padding: const EdgeInsets.all(70),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Text(
          //   name,
          //   style: TextStyle(fontSize: 30),
          // ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              "title",
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "title",
                border: myinputborder(), //normal border
                enabledBorder: myinputborder(), //enabled border
                focusedBorder: myfocusborder(), //focused border
                // set more border style like disabledBorder
              )),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              "link",
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          TextField(
              controller: linkController,
              decoration: InputDecoration(
                hintText: "link",
                border: myinputborder(), //normal border
                enabledBorder: myinputborder(), //enabled border
                focusedBorder: myfocusborder(), //focused border
                // set more border style like disabledBorder
              )),
          Container(
            margin: const EdgeInsets.all(50),
            child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      ApiResponse<EditLink> userApiResponse =
                      await EditLinkProvider().editLink(
                          itemData!.id??0,
                          titleController.text,
                          linkController.text,
                          savedUser!.name??"",
                          0);
                      if (userApiResponse.status == Status.LOADING) {
                      } else if (userApiResponse.status == Status.COMPLETED) {
                        Fluttertoast.showToast(
                            msg: userApiResponse.data!.message.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.yellow);
                        print("Log COMPLETED status${userApiResponse.data?.message}");
                        Navigator.pop(context);

                      } else if (userApiResponse.status == Status.ERROR) {
                        print("Log Error status${userApiResponse.data?.message}");
                      }
                    } catch (e) {
                      // An error occurred
                      print('Log An error occurred: $e');
                    }
                    // Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 100, 69, 58),
                    backgroundColor: const Color.fromARGB(220, 255, 212, 101),
                    minimumSize: const Size(138, 50),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )),
          ),

          /*TextField(
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Passward'),
            keyboardType: TextInputType.numberWithOptions(),
            controller: passwardController,
            onChanged: (String value) {
              userName = value;
            },
          ),*/
        ]),
      ),
    );
  }
}
