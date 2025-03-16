import 'package:flutter/material.dart';
import '../theaming/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.widget, required this.onTap});
  final Widget widget;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.myPrimaryBlue,
        ),
        height: MediaQuery.of(context).size.height * 0.07,
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
