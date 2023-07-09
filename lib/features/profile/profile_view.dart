import 'package:bootcamp_starter/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../core/util/constants.dart';
import '../../core/util/styles.dart';

class ProfileView extends StatefulWidget {
  static String id = '/profileView';

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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardProfile(),
              LinksListItem(),
              LinksListItem(),
              LinksListItem()
            ],
          ),
          Positioned(
            bottom: 100,
            right: 20,
            child: InkWell(
              onTap: () {
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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color(0xFF2D2B4E),
      //   onPressed: () {},
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
    );
  }
}

class LinksListItem extends StatelessWidget {
  const LinksListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          // CustomButton(),

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
            onPressed: (context) {},
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
  const CardProfile({super.key});

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
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "John Doe",
                    style: Styles.textStyleWhiteBold,
                  ),
                  Text(
                    "example@gmail.com",
                    style: Styles.textStyleWhiteBold,
                  ),
                  Text(
                    "+9700000000",
                    style: Styles.textStyleWhiteBold,
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
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
