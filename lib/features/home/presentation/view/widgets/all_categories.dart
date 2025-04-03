import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants.dart';
import '../../view_model/get_home_product.dart/get_home_product_cubit.dart';
import 'category_item.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 36.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: categoriesName.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            isSelected: selectIndex == index,
            categoryName: categoriesName[index],
            onTap: () {
              setState(() {
                selectIndex = index;
                categoriesName[index];
              });
              BlocProvider.of<GetHomeProductCubit>(context).getHomeProduct(
                  categoryName: categoriesName[index] == "All"
                      ? null
                      : categoriesName[index]);
            },
          );
        },
      ),
    );
  }
}
