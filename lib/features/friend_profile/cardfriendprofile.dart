import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';
class cardfriendprofile extends StatefulWidget {
  const cardfriendprofile({Key? key}) : super(key: key);

  @override
  State<cardfriendprofile> createState() => _cardfriendprofileState();
}

class _cardfriendprofileState extends State<cardfriendprofile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
        top: 36,
          right: 38,
          left: 39,
        ),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color:kPrimaryColor,
              borderRadius: BorderRadius.circular(15),

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 21,left: 24,bottom: 21,),
            child: Row(
              children: [
            CircleAvatar(
                    backgroundImage: AssetImage('assets/imgs/profile.png'),
                    radius: 50,


                    ),
               SizedBox(
                 width: 16,
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   text_style( size: 16,color: kScaffoldColor,text: 'John Doe',fontWeight: FontWeight.w600,),
                   // SizedBox(
                   //   height: 6,
                   // ),
                   text_style( size: 16,color: kScaffoldColor,text: 'example@gmail.com',fontWeight: FontWeight.w600,),
                   SizedBox(
                     height: 13,
                   ),
                   ElevatedButton(
                       style: ElevatedButton.styleFrom(
                       // fixedSize:  Size(66, 24),
                        backgroundColor: kSecondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                       ),
                       onPressed: (){},
                       child: text_style(
                         text: 'Follow',
                         color: kPrimaryColor,
                         size: 14,
                         fontWeight: FontWeight.w600,
                       )
                   )
                 ],
               )
               // ),
            ],


            ),
          )
        ],
      )

    );
  }
}
