import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theaming/styles.dart';
import '../../../data/models/product_model.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.productModel.image,
              errorWidget: (context, url, error) {
                return Image.asset("assets/images/errorImage.png",
                    height: 80.h, fit: BoxFit.cover);
              },
              height: 120.h,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.productModel.name,
            style: Styles.textStyleBlack16DmSansFont.copyWith(
              fontSize: 14.sp,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r"$  " + widget.productModel.price.toString(),
                style: Styles.textStyleGrey16,
              ),
              IconButton(
                icon: isFavorite
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                      ),
                onPressed: () {
                  setState(() {
                    if (isFavorite) {
                      isFavorite = false;
                    } else {
                      isFavorite = true;
                    }
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
