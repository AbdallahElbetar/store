import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/product_model.dart';
import 'product_item.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisCount: 2,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 10.w,
          ),
          itemBuilder: (context, index) {
            return ProductItem(
              productModel: products[index],
            );
          }),
    );
  }
}
