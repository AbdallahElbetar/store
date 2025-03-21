import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theaming/colors.dart';
import '../../../../../core/theaming/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.categoryName,
      required this.isSelected,
      required this.onTap});
  final String categoryName;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.myGrey),
            color: isSelected ? AppColors.myPrimaryBlue : Colors.transparent,
          ),
          height: 36.h,
          child: Center(
            child: Text(
              categoryName,
              style: isSelected
                  ? Styles.textStyleWhite16
                  : Styles.textStyleBlack16,
            ),
          ),
        ),
      ),
    );
  }
}
