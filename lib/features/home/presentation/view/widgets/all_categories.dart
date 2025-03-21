import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/features/home/presentation/view/widgets/category_item.dart';

import '../../../../../core/constants.dart';

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
              });
            },
          );
        },
      ),
    );
  }
}
