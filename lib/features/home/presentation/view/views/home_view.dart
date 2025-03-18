import 'package:flutter/material.dart';
import 'package:store/core/theaming/colors.dart';
import 'package:store/core/theaming/styles.dart';

import '../widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        CustomAppBar(),
      ]),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              filled: true,
              hintText: "Search for clothes...",
              hintStyle: Styles.textStyleGrey16,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.myPrimaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.tune,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}
