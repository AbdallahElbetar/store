import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theaming/styles.dart';
import '../../../../../core/widgets/custom_circular_anmition_idicator.dart';
import '../../view_model/get_home_product.dart/get_home_product_cubit.dart';
import '../../view_model/get_home_product.dart/get_home_product_states.dart';
import '../widgets/all_categories.dart';
import '../widgets/all_products.dart';
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            DisplayAllProducts(
              categoryName: null,
              isFavorite: false,
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayAllProducts extends StatelessWidget {
  const DisplayAllProducts({
    super.key,
    required this.categoryName,
    required this.isFavorite,
  });
  final String? categoryName;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetHomeProductCubit, GetHomeProductStates>(
        bloc: BlocProvider.of<GetHomeProductCubit>(context),
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetHomeProductSuccessState) {
            if (state.products.isEmpty) {
              return Center(
                child: Text(
                  "No products found",
                  style: Styles.textStyleBlack16ReadexProFont,
                ),
              );
            }

            return AllProducts(
              products: state.products,
            );
          } else if (state is GetHomeProductLoadingState) {
            log("Loading");
            return CustomCircularAnmitionIdicator();
          } else if (state is GetHomeProductFailureState) {
            Text(state.errorMessage);
          }
          return const Center(
            child: Text(
              "Something went wrong",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        });
  }
}
