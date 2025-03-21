import 'package:flutter/material.dart';

import '../widgets/all_categories.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_search_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CustomAppBar(),
            CustomSearchBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            AllCategories(),
          ],
        ),
      ),
    );
  }
}
