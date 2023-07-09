import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/widgets/text_style.dart';

class secandLabeledTextFieldWidget extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  const secandLabeledTextFieldWidget(
      {super.key,
        required this.label,
        this.controller,
        required this.hint,
        this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text_style(text: label,color: Colors.black,size: 24,fontWeight: FontWeight.w600,),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 50,
          child: TextField(

            keyboardType: keyboardType,
            controller: controller,

            decoration: InputDecoration(

              contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              hintText: hint,
              border: Styles.primaryRoundedOutlineInputBorder,
              focusedBorder: Styles.primaryRoundedOutlineInputBorder,
              enabledBorder: Styles.primaryRoundedOutlineInputBorder,
              disabledBorder: Styles.primaryRoundedOutlineInputBorder,
            hintStyle: TextStyle(color: kLightPrimaryColor,fontSize: 12,fontWeight: FontWeight.w500)
            ),
          ),
        ),
      ],
    );
  }
}
