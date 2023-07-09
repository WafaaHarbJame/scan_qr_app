import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final double? width;
  final Color backColor;

  const PrimaryButtonWidget(
      {super.key,
      required this.onTap,
      this.width = double.infinity,
      required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: kPrimaryColor, width: 2)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
            width: width,
            height: 50,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.orange,
              ),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            )),
      ),
    );
  }
}
