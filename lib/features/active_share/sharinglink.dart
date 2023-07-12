import 'package:bootcamp_starter/features/active_share/NearstSharingResponse.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';

import '../friend_profile/friend_profile.dart';
class ShareLinkList extends StatelessWidget {
  final List<NearestUsers>? itemList;

  const ShareLinkList({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 39, right: 38),
      shrinkWrap: true,
      itemCount: itemList?.length ?? 0,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => friendprofile(itemData: itemList![index])),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kLightPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(itemList![index].user?.name ?? ""),
                  leading: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        );
      },
    );
  }
}
