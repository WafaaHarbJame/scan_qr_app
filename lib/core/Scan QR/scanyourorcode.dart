import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';
class ScanyourQRCode extends StatefulWidget {
  const ScanyourQRCode({Key? key}) : super(key: key);

  @override
  State<ScanyourQRCode> createState() => _ScanyourQRCodeState();
}

class _ScanyourQRCodeState extends State<ScanyourQRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding:  EdgeInsets.only(top: 34, ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back_ios,color: Colors.white),
            SizedBox(
              height:34 ,
            ),
            Center(child: text_style(
              text: "Scan your QR Code", color: Colors.white,size:30  ,
            )
            ),

              SizedBox(
                height: 76,
              ),
            Center(
child :Stack(
  children: [

    Image.asset("assets/imgs/img.png",
      height: 341.58,
      width: 317.72,
      color: Colors.white,
    ),
    Image.asset("assets/imgs/img_1.png",
      height: 341.58,
      width: 317.72,
      // color: Colors.white,
    )
  ],
)

           )
          ],
        ),
      ),
    ) ;
  }
}
