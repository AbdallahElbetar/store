import 'package:flutter/material.dart';

import '../../../../../core/theaming/colors.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: AppColors.myGrey,
          thickness: 0.1,
        )),
      ],
    );
  }
}
