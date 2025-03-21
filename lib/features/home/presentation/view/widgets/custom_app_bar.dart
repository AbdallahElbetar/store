import 'package:flutter/material.dart';

import '../../../../../core/theaming/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 25,
        ),
        Text(
          "Discover",
          style: Styles.textStyleBlack32,
        ),
      ],
    );
  }
}
