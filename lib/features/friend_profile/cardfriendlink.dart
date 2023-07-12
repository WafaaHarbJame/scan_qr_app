import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/cardfriendlinks.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';

import '../profile/links/models/link_model.dart';
class LinkList extends StatelessWidget {
  final List<Link>? itemList;

  const LinkList({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding:EdgeInsets.only(left: 39,right: 38),
        shrinkWrap: true,
        itemCount: itemList?.length ?? 0,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index)
        {
          return Column(
            children: [
              cardfriendlinks( title: itemList![index]?.title ?? "",
                subtitle: itemList?[index].link ?? "",

                colorcard:kLightDangerColor ,
                colortext: kOnLightDangerColor,

              ),

              SizedBox(height: 25,)







            ],
          );

        }

    );
  }
}
