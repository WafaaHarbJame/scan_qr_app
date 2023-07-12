import 'package:bootcamp_starter/features/edit_link/edit_link.dart';
import 'package:bootcamp_starter/features/new_link/add_link_screen.dart';
import 'package:bootcamp_starter/features/profile/links/models/link_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../core/util/constants.dart';
import '../../core/util/styles.dart';
import '../../network/api_response.dart';
import '../auth/ShPreferences.dart';
import '../auth/user_model.dart';
import '../edit_user_info/edit_user_info.dart';
import 'links/providers/links_provider.dart';

class ProfileView extends StatefulWidget {
  static const id = '/profileView';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
        Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           CardProfile(),
          Consumer<LinkProvider>(
            builder: (_, linkProvider, __) {
              if (linkProvider.linkList.status == Status.LOADING) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (linkProvider.linkList.status == Status.ERROR) {
                return Center(
                  child: Text('${linkProvider.linkList.message}'),
                );
              }
              return Expanded(child: LinkList(itemList: linkProvider.linkList.data));

            },

          ),


            ],
          ),
          Positioned(
            bottom: 100,
            right: 20,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddLinkView()),
                );
                // handle button press
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                ),
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     elevation: 0,
    //     title: const Text("Profile"),
    //     centerTitle: true,
    //     backgroundColor: Colors.transparent,
    //   ),
    //   body:  Consumer<LinkProvider>(
    //     builder: (_, linkProvider, __) {
    //       if (linkProvider.linkList.status == Status.LOADING) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (linkProvider.linkList.status == Status.ERROR) {
    //         return Center(
    //           child: Text('${linkProvider.linkList.message}'),
    //         );
    //       }
    //       print("Log  linkList ${linkProvider.linkList.data!.length}");
    //       return ListView.builder(
    //           padding: const EdgeInsets.symmetric(horizontal: 15),
    //           itemCount: linkProvider.linkList.data?.length,
    //           scrollDirection: Axis.vertical,
    //           itemBuilder: (BuildContext context, int index) {
    //             // return linkProvider.linkList.data?[index];
    //             Link? link = linkProvider.linkList.data?[index];
    //             return Slidable(
    //               key: const ValueKey(0),
    //               endActionPane: ActionPane(
    //                 motion: const ScrollMotion(),
    //                 dismissible: DismissiblePane(onDismissed: () {}),
    //                 children: [
    //                   SlidableAction(
    //                     onPressed: (context) {},
    //                     flex: 1,
    //                     backgroundColor: kDangerColor,
    //                     foregroundColor: Colors.white,
    //                     borderRadius:
    //                     const BorderRadius.all(Radius.circular(15)),
    //                     icon: Icons.delete,
    //                   ),
    //                   const SizedBox(
    //                     width: 4, // Add desired width between actions
    //                   ),
    //                   SlidableAction(
    //                     onPressed: (context) {
    //                       Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => edit_link()),
    //                       );
    //                     },
    //                     flex: 1,
    //                     backgroundColor: kSecondaryColor,
    //                     foregroundColor: Colors.white,
    //                     borderRadius:
    //                     const BorderRadius.all(Radius.circular(15)),
    //                     icon: Icons.edit,
    //                   ),
    //                   const SizedBox(
    //                     width: 4, // Add desired width between actions
    //                   )
    //                 ],
    //               ),
    //               child: Container(
    //                 padding: const EdgeInsets.all(12),
    //                 margin: const EdgeInsets.symmetric(
    //                     horizontal: 20, vertical: 8),
    //                 decoration: const BoxDecoration(
    //                     color: Color(0xffFFE6A6),
    //                     borderRadius:
    //                     BorderRadius.all(Radius.circular(8))),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.stretch,
    //                   children: [
    //                     Text(
    //                         linkProvider.linkList.data![index].title
    //                             ??"",
    //                         style: const TextStyle(
    //                           color: kOnLightDangerColor,
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 14,
    //                         )),
    //                     Text(
    //                         linkProvider.linkList.data![index].link??"",
    //                         style: const TextStyle(
    //                           color: kRed2DangerColor,
    //                           fontWeight: FontWeight.normal,
    //                           fontSize: 14,
    //                         )),
    //
    //                     // background: #784E00;
    //                   ],
    //                 ),
    //               ),
    //             );
    //           });
    //     },
    //
    //     // Stack(
    //     //   children: [
    //     //     Column(
    //     //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //     //       children: [
    //     //         CardProfile(),
    //     //       ],
    //     //     ),
    //     //     Positioned(
    //     //       bottom: 100,
    //     //       right: 20,
    //     //       child: InkWell(
    //     //         onTap: () {
    //     //           Navigator.push(context,
    //     //               MaterialPageRoute(builder: (context) => AddLinkView()));
    //     //           // handle button press
    //     //         },
    //     //         child: Container(
    //     //           width: 70,
    //     //           height: 70,
    //     //           decoration: const BoxDecoration(
    //     //             shape: BoxShape.circle,
    //     //             color: kPrimaryColor,
    //     //           ),
    //     //           child: const Icon(
    //     //             Icons.add,
    //     //             size: 30,
    //     //             color: Colors.white,
    //     //           ),
    //     //         ),
    //     //       ),
    //     //     ),
    //     //   ],
    //     // ),
    //   )
    //
    //
    //   // floatingActionButton: FloatingActionButton(
    //   //   backgroundColor: const Color(0xFF2D2B4E),
    //   //   onPressed: () {},
    //   //   child: const Icon(
    //   //     Icons.add,
    //   //     color: Colors.white,
    //   //   ),
    // );
  }
}

class LinksListItem extends StatelessWidget {
  const LinksListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: (context) {},
            flex: 1,
            backgroundColor: kDangerColor,
            foregroundColor: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            icon: Icons.delete,
          ),
          // const SizedBox(
          //   width: 30,
          // ),
          const SizedBox(
            width: 4, // Add desired width between actions
          ),
          SlidableAction(
            onPressed: (context) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => edit_link()),
              // );
            },
            flex: 1,
            backgroundColor: kSecondaryColor,
            foregroundColor: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            icon: Icons.edit,
          ),
          const SizedBox(
            width: 4, // Add desired width between actions
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: const BoxDecoration(
            color: Color(0xffFFE6A6),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Instagram",
                style: TextStyle(
                  color: kOnLightDangerColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                )),
            Text("https://www.instagram.com/a7medhq/",
                style: TextStyle(
                  color: kRed2DangerColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                )),

            // background: #784E00;
          ],
        ),
      ),
    );
  }
}

class CardProfile extends StatelessWidget {
  User? savedUser = ShPreferences.getUser();

  CardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          color: kPrimaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/imgs/user_photo.png'),
              ),
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    savedUser?.name??"",
                    style: Styles.textStyleWhiteBold,
                  ),
                  Text(
                    savedUser?.email??"",
                    style: Styles.textStyleWhiteBold,
                  ),
                  Text(
                    "+9700000000",
                    style: Styles.textStyleWhiteBold,
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => edit_user_info()),
                  );
                },
                icon: const Icon(Icons.edit),
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  int backColor = 0;

  CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          // handle button press
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: kDangerColor,
          ),
          child: const Icon(
            Icons.delete,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class LinkList extends StatelessWidget {
  final List<Link>? itemList;
  const LinkList({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: itemList?.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    flex: 1,
                    backgroundColor: kDangerColor,
                    foregroundColor: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    icon: Icons.delete,
                  ),
                  const SizedBox(
                    width: 4, // Add desired width between actions
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => edit_link(itemData: itemList?[index]),
                        ),
                      );
                    },
                    flex: 1,
                    backgroundColor: kSecondaryColor,
                    foregroundColor: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    icon: Icons.edit,
                  ),
                  const SizedBox(
                    width: 4, // Add desired width between actions
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: const BoxDecoration(
                  color: Color(0xffFFE6A6),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      itemList![index]?.title ?? "",
                      style: const TextStyle(
                        color: kOnLightDangerColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      itemList?[index].link ?? "",
                      style: const TextStyle(
                        color: kRed2DangerColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),

                    // background: #784E00;
                  ],
                ),
              ),
            );
          },
        ));
  }
}
