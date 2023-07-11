import 'dart:io';

import 'package:flutter/material.dart';

import '../profile/links/models/link_model.dart';

class LinkListHome extends StatelessWidget {
  final List<Link>? itemList;


   LinkListHome({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 109,
      child: ListView.builder(

          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: itemList?.length ?? 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Column(
                children: [

            Container(
            padding:  const EdgeInsets.all(20),
            margin: const EdgeInsets.only(right: 12),
            decoration:  const BoxDecoration(
            color: Color(0xffFFE6A6),
            borderRadius: BorderRadius.all(Radius.circular(8))),
            child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(itemList![index].title ?? "",
            style: const TextStyle(
            color: Color(0xff784E00),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            )),
            Text(itemList?[index].link ?? "",
            style: const TextStyle(
            color: Color(0xff784E00),
            fontWeight: FontWeight.normal,
            fontSize: 15,
            )),

            // background: #784E00;
            ],
            ),
            ),
            // cardfriendlinks( title: itemList![index]?.title ?? "",
            //   subtitle: itemList?[index].link ?? "",
            //
            //   colorcard:kLightDangerColor ,
            //   colortext: kOnLightDangerColor,
            //
            // ),
            //
            // SizedBox(height: 20,)
            //


            ],
            );

          }

      ),
    );
  }
}
