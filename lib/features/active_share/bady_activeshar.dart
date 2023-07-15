import 'package:bootcamp_starter/features/active_share/sharinglink.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';
import 'package:provider/provider.dart';

import '../../network/api_response.dart';
import '../friend_profile/cardfriendlink.dart';
import '../friend_profile/friend_profile.dart';
import '../profile/links/providers/links_provider.dart';

class badyactiveshar extends StatefulWidget {
  const badyactiveshar({Key? key}) : super(key: key);

  @override
  State<badyactiveshar> createState() => _badyactivesharState();
}

class _badyactivesharState extends State<badyactiveshar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 42, left: 42),
      child: Column(
        children: [
          Consumer<LinkProvider>(
            builder: (_, linkProviders, __) {
              if (linkProviders.linkNearList.status == Status.LOADING) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (linkProviders.linkNearList.status == Status.ERROR) {
                return Center(
                  child: Text('${linkProviders.linkNearList.message}'),
                );
              }
              return  ShareLinkList(itemList: linkProviders.linkNearList.data);

            },

          )
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => friendprofile()));
          //
          //   },
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: kLightPrimaryColor,
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: const ListTile(
          //       title: Text("ahmed Ali"),
          //       leading: Icon(Icons.person),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 9),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => friendprofile()));
          //
          //   },
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: kLightPrimaryColor,
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: const ListTile(
          //       title: Text("ahmed Ali"),
          //       leading: Icon(Icons.person),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 9),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => friendprofile()));
          //
          //   },
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: kLightPrimaryColor,
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: const ListTile(
          //       title: Text("ahmed Ali"),
          //       leading: Icon(Icons.person),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 9),
        ],
      ),
    );
  }
}
