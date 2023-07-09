import 'package:flutter/material.dart';

class edit_link extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _edit_linkState();
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
  var passwardController = TextEditingController();

  var itemSelected;
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
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 100, 69, 58),
                  backgroundColor: const Color.fromARGB(220, 255, 212, 101),
                  minimumSize: const Size(
                    138,
                    50,
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
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