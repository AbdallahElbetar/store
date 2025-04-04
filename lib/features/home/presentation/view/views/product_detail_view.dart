import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/theaming/colors.dart';
import '../../../../../core/theaming/styles.dart';

import '../../../data/models/product_model.dart';
import '../widgets/custom_horizontal_divider.dart';

import '../widgets/custom_add_to_cart_button.dart';
import '../widgets/rating_product.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Details",
          style: Styles.textStyleBlack32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: PageView.builder(
                itemCount: productModel.images.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: productModel.images[index],
                    errorWidget: (context, url, error) {
                      return Image.asset("assets/images/errorImage.png");
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: productModel.images.length,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                      spacing: 20.0.h,
                      radius: 10.h,
                      dotWidth: 16.0.h,
                      dotHeight: 16.0.h,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: AppColors.myGrey,
                      activeDotColor: AppColors.myPrimaryBlue),
                ),
              ],
            ),
            Text(
              productModel.name,
              style: Styles.textStyleBlack26DmSansFont,
              maxLines: 3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RatingProduct(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              productModel.description,
              style: Styles.textStyleGrey16DmSansFont
                  .copyWith(overflow: TextOverflow.ellipsis),
              maxLines: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            CustomHorizontalDivider(),
            CustomAddToCartButton(
              productModel: productModel,
            )
          ],
        ),
      ),
    );
  }
}
