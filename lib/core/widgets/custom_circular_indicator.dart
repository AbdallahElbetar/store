import 'package:flutter/material.dart';
import 'package:store/core/theaming/colors.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.myWhite,
    );
  }
}
