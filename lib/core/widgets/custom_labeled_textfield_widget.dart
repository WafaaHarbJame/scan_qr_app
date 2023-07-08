import 'package:bootcamp_starter/core/util/styles.dart';
import 'package:flutter/material.dart';

class PrimaryLabeledTextFieldWidget extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final bool password;
  final TextInputType? keyboardType;
  const PrimaryLabeledTextFieldWidget(
      {super.key,
      required this.label,
      this.controller,
      this.hint,
      this.password = false,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.textStyle14,
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 50,
          child: TextField(
            keyboardType: keyboardType,
            controller: controller,
            obscureText: password,
            enableSuggestions: password == true ? false : true,
            autocorrect: password == true ? false : true,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              hintText: hint,
              border: Styles.primaryRoundedOutlineInputBorder,
              focusedBorder: Styles.primaryRoundedOutlineInputBorder,
              enabledBorder: Styles.primaryRoundedOutlineInputBorder,
              disabledBorder: Styles.primaryRoundedOutlineInputBorder,
            ),
          ),
        ),
      ],
    );
  }
}
