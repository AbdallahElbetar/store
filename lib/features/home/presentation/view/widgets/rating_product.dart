import 'package:flutter/material.dart';

import '../../../../../core/theaming/colors.dart';
import '../../../../../core/theaming/styles.dart';

class RatingProduct extends StatelessWidget {
  const RatingProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: AppColors.myYellow,
        ),
        Text(
          "4.0/5",
          style: Styles.textStyleBlack16ReadexProFont,
        ),
        Text(
          "(45 reviews)",
          style: Styles.textStyleGrey16ReadexProFont,
        ),
      ],
    );
  }
}
