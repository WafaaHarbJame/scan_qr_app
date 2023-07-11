import 'package:bootcamp_starter/core/util/styles.dart';
import 'package:flutter/material.dart';

class PrimaryLabeledTextFieldWidget extends StatelessWidget {
  final String label;
  final String? hint;
  final String? errorMessage;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool password;
  final TextInputType? keyboardType;
  const PrimaryLabeledTextFieldWidget(
      {super.key,
      required this.label,
      this.controller,
      this.hint,
      this.password = false,
      this.errorMessage,
      this.validator,
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
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          obscureText: password,
          validator: validator,
          enableSuggestions: password == true ? false : true,
          autocorrect: password == true ? false : true,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            hintText: hint,
            errorText: errorMessage,
            border: Styles.primaryRoundedOutlineInputBorder,
            focusedBorder: Styles.primaryRoundedOutlineInputBorder,
            enabledBorder: Styles.primaryRoundedOutlineInputBorder,
            errorBorder: Styles.redRoundedOutlineInputBorder,
            disabledBorder: Styles.primaryRoundedOutlineInputBorder,
          ),
        ),
      ],
    );
  }
}
