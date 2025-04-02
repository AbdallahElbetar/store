import 'package:flutter/material.dart';

import '../../../../../core/theaming/colors.dart';
import '../../../../../core/theaming/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final IconButton? suffixIcon;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.isPassword,
      required this.controller,
      required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Styles.textStyleBlack16ReadexProFont,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Field is required';
            }
            return null;
          },
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            label: Text(
              labelText,
              style: Styles.textStyleGrey16,
            ),
            hintText: hintText,
            hintStyle: Styles.textStyleGrey16,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.myGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.myGrey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.myGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
