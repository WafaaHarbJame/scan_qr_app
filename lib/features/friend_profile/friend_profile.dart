import 'package:bootcamp_starter/features/active_share/NearstSharingResponse.dart';
import 'package:bootcamp_starter/features/friend_profile/appBarFriendProfile.dart';
import 'package:bootcamp_starter/features/friend_profile/cardfriendlink.dart';
import 'package:bootcamp_starter/features/friend_profile/cardfriendprofile.dart';
import 'package:bootcamp_starter/features/profile/links/providers/links_provider.dart';
import 'package:bootcamp_starter/network/api_response.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class friendprofile extends StatefulWidget {
  final NearestUsers itemData;

  friendprofile({Key? key, required this.itemData}) : super(key: key);
  static String id = '/friendprofile';

  @override
  _friendprofileState createState() => _friendprofileState();
}

class _friendprofileState extends State<friendprofile> {
  @override
  Widget build(BuildContext context) {
    print('Log itemData ${widget.itemData.user?.name}');
    print('Log itemData ${widget.itemData.user?.name}');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBarfriendprofile(),
            const cardfriendprofile(),
            const SizedBox(
              height: 30,
            ),
            Consumer<LinkProvider>(
              builder: (_, linkProviders, __) {
                if (linkProviders.linkList.status == Status.LOADING) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (linkProviders.linkList.status == Status.ERROR) {
                  return Center(
                    child: Text('${linkProviders.linkList.message}'),
                  );
                }
                return LinkList(itemList: linkProviders.linkList.data);
              },
            ),
          ],
        ),
      ),
    );
  }
}