import 'package:flutter/material.dart';
import 'package:store/features/home/data/models/product_model.dart';

import '../../../../../core/theaming/colors.dart';
import '../../../../../core/theaming/styles.dart';

class CustomAddToCartButton extends StatelessWidget {
  const CustomAddToCartButton({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "Price",
                style: Styles.textStyleGrey16ReadexProFont,
              ),
              Text(
                r"$ " + productModel.price.toString(),
                style: Styles.textStyleBlack32,
              ),
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.06),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.60,
            decoration: BoxDecoration(
              color: AppColors.myPrimaryBlue,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColors.myWhite,
                  ),
                  Text(
                    " Add To Cart",
                    style: Styles.textStyleWhite16,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
