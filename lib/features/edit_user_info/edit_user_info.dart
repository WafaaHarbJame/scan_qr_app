import 'package:flutter/material.dart';

class edit_user_info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _edit_user_infoState();
  }
}

OutlineInputBorder myinputborder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      color: Colors.black,
      width: 2,
    ),
  );
}

OutlineInputBorder myfocusborder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      color: Colors.black,
      width: 2,
    ),
  );
}

class _edit_user_infoState extends State<edit_user_info> {
  var name = "Text";
  String userName = '';
  var passwardController = TextEditingController();

  var itemSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(213, 231, 229, 241),
        centerTitle: false,
        title: const Text(
          "Edit User Info",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.start,
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
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/imgs/user_photo.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Name",
                style: TextStyle(fontSize: 15, color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "name",
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Email",
                style: TextStyle(fontSize: 15, color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "example@gmail.com",
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Phone",
                style: TextStyle(fontSize: 15, color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                hintText: "+970...",
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'SAVE',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
