import 'package:flutter/material.dart';

import '../../../../../core/theaming/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 15,
        ),
        Text(
          "Discover",
          style: Styles.textStyleBlack32,
        ),
      ],
    );
  }
}
