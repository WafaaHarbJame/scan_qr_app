import 'dart:ffi';

import 'package:bootcamp_starter/features/active_share/providers/active_share_provider.dart';
import 'package:bootcamp_starter/features/home/LinkListHome.dart';
import 'package:bootcamp_starter/features/new_link/add_link_screen.dart';
import 'package:bootcamp_starter/features/onbording/onbording_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../core/util/constants.dart';
import '../../network/api_response.dart';
import '../Scan QR/scanyourorcode.dart';
import '../active_share/ActiveSharing.dart';
import '../active_share/Active_sharing_model.dart';
import '../auth/ShPreferences.dart';
import '../auth/user_model.dart';
import '../profile/links/providers/links_provider.dart';

class HomeView extends StatefulWidget {
  static String id = '/homeView';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  User? savedUser = ShPreferences.getUser();
  bool isCompleted = false; // Initial value of isCompleted flag

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScanyourQRCode()));
              },
              icon: const Icon(Icons.qr_code_scanner)),
          IconButton(
              iconSize: 40,
              onPressed: () {
                showLogoutConfirmationDialog(context);
              },
              icon: const Icon(Icons.logout))
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
            decoration: BoxDecoration(
              border: isCompleted
                  ? Border.all(
                      color: Colors.green, // Set the desired border color
                      width: 2.0, // Set the desired border width
                    )
                  : null, // No border if not completed
            ),
            child: GestureDetector(
              onTap: () async {
                makeShare(context, true);
              },
              onDoubleTap: () {
                makeShare(context, false);
              },
              child: QrImageView(
                data: 'This is a simple QR code',
                version: QrVersions.auto,
                size: 280,
                gapless: false,
              ),
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

              final itemList = linkProviders.linkList.data;
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LinkListHome(itemList: itemList?.take(2).toList()),
                        if (itemList != null && itemList.length > 2) SizedBox(height: 2),
                         AddItem(),
                      ],
                    ),
                  ),
                ],
              );
              return Row(
                children: [
                  Expanded(
                    child: LinkListHome(itemList: itemList?.take(2).toList()),
                  ),
                  if (itemList != null && itemList.length >= 2) SizedBox(width: 8),
                  AddItem(),
                ],
              );

              // return Row(
              //   children: [
              //     Expanded(
              //       child: LinkListHome(itemList: itemList?.take(2).toList()),
              //     ),
              //     if (itemList != null && itemList.length >= 2) Spacer(),
              //     if (itemList != null && itemList.length <= 2) Expanded(child: AddItem()),
              //   ],
              // );
              // return Row(
              //   children: [
              //     Expanded(
              //       child: LinkListHome(itemList: itemList?.take(2).toList()),
              //     ),
              //     AddItem(),
              //   ],
              // );
              //
              // //return LinkListHome(itemList: itemsToShow);
              // return LinkListHome(itemList: linkProviders.linkList.data?.take(2).toList());
            },
          )
        ],
      ),
    );
  }

  // void initData(User savedUser) {
  //   print('Log  initData User ID: ${savedUser.name}');
  // }

  Future<void> makeShare(BuildContext context, bool isShare) async {
    try {
      ApiResponse<ActiveSharingResponse> apiResponse =
          await ActiveSharingProvider1().activeShare("sender");
      if (apiResponse.status == Status.LOADING) {
      } else if (apiResponse.status == Status.COMPLETED) {
        print("Log share COMPLETED ${apiResponse.data?.activeSharing?.id}");
        setState(() {
          if (isShare) {
            isCompleted = true;
          } else {
            isCompleted = false;
          }
        });
      } else if (apiResponse.status == Status.ERROR) {
        print("Log share Error status ${apiResponse.message}");
      }
    } catch (e) {
      // An error occurred
      print('Log An error occurred: $e');
    }
  }

  void logoutAndClearData(BuildContext context) {
    // Clear shared preferences data
    ShPreferences.saveUser(null);
    ShPreferences.saveToken(null);

    // Navigate to the login or home screen
    // Replace `LoginScreen` with your desired screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => OnBoardingView()),
      (route) => false,
    );
  }
}

void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('Confirm Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              logoutAndClearData(context);
            },
            child: Text('Logout'),
          ),
        ],
      );
    },
  );
}

void logoutAndClearData(BuildContext context) {
  // Clear shared preferences data
  ShPreferences.saveUser(null);
  ShPreferences.saveToken(null);

  // Navigate to the login or home screen
  // Replace `LoginScreen` with your desired screen
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) => OnBoardingView()),
    (route) => false,
  );
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

// Consumer<ActiveSharingProvider>(
//   builder: (_, activeSharingProvider, __) {
//     if (activeSharingProvider.activeSharing().status ==
//         Status.LOADING) {}
//     if (activeSharingProvider.activeSharing().status ==
//         Status.ERROR) {
//       print('Log ${activeSharingProvider.activeSharing().message}');
//     }
//     // if (activeSharingProvider.activeSharing().status ==
//     //     Status.COMPLETED) {
//     //   print('Log ${activeSharingProvider.activeShare.data}');
//     // }
//     return Container(
//       decoration: BoxDecoration(
//         color: kLightPrimaryColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: QrImageView(
//         data: 'This is a simple QR code',
//         version: QrVersions.auto,
//         size: 280,
//         gapless: false,
//       ),
//     );
//   },
// );
