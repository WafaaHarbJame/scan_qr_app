import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/home/LinkListHome.dart';
import 'package:bootcamp_starter/features/new_link/add_link_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../network/api_response.dart';
import '../Scan QR/scanyourorcode.dart';
import '../auth/ShPreferences.dart';
import '../auth/user_model.dart';
import '../friend_profile/cardfriendlink.dart';
import '../profile/links/providers/links_provider.dart';

class HomeView extends StatelessWidget {
  static String id = '/homeView';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    User? savedUser = ShPreferences.getUser();
    String? token = ShPreferences.getToken();
    if (savedUser != null) {
      initData(savedUser);
    }
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScanyourQRCode()));
              },
              icon: const Icon(Icons.qr_code_scanner))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Hello, ${savedUser?.name ?? ''}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(30),
            child: QrImageView(
              data: 'This is a simple QR code',
              version: QrVersions.auto,
              size: 280,
              gapless: false,
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
            indent: 80,
            endIndent: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          // CustomList(),
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
              return  LinkListHome(itemList: linkProviders.linkList.data);

            },

          )
        ],
      ),
    );
  }

  void initData(User savedUser) {
    print('Log  initData User ID: ${savedUser.name}');

  }
}

class CustomList extends StatelessWidget {
  CustomList({super.key});

  List<Widget> data = [
    const ListItem(),
    const ListItem(),
    const AddItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 109,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return data[index];
          }),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 12),
      decoration: const BoxDecoration(
          color: Color(0xffFFE6A6),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("FaceBook",
              style: TextStyle(
                color: Color(0xff784E00),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          Text("@oalshokri",
              style: TextStyle(
                color: Color(0xff784E00),
                fontWeight: FontWeight.normal,
                fontSize: 15,
              )),

          // background: #784E00;
        ],
      ),
    );
  }
}

class AddItem extends StatelessWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(right: 12),
      decoration: const BoxDecoration(
          color: Color(0xffE7E5F1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddLinkView()));
              },
              icon: const Icon(Icons.add)),
          const Text("add",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              )),

          // background: #784E00;
        ],
      ),
    );
  }
}
