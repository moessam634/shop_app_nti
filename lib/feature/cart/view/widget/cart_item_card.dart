import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/core/style/text_style.dart';
import '../../../../core/style/size_app.dart';
import '../../cubit/cart_cubit.dart';
import '../../data/model/cart_model.dart';

class CartItemCard extends StatelessWidget {
  final CartModel cartItem;
  final String productId;

  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: SizeApp.s8.h),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: cartItem.image,
            placeholder: (context, url) => SpinKitFadingCircle(
              color: Colors.grey,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: SizeApp.s80.h,
            width: SizeApp.s80.w,
            fit: BoxFit.cover,
          ),
          SizedBox(width: SizeApp.s16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.name,
                  style: bold16(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  cartItem.description,
                  style: grey14(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: SizeApp.s8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${cartItem.price.toStringAsFixed(2)}",
                      style: green14(),
                    ),
                    Text(
                      "Qty: ${cartItem.quantity}",
                      style: blue14(),
                    ),
                    IconButton(
                        onPressed: () {
                          AddCartCubit.get(context)
                              .deleteProduct(productId: productId);
                        },
                        icon: Icon(Icons.delete)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
