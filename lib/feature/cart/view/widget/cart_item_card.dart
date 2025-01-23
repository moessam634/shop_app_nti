import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/style/size_app.dart';
import '../../cubit/add_cart_cubit.dart';
import '../../cubit/add_cart_state.dart';
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
      margin: EdgeInsets.symmetric(
          horizontal: SizeApp.s16.w, vertical: SizeApp.s8.h),
      child: Padding(
        padding: const EdgeInsets.all(SizeApp.s16),
        child: Row(
          children: [
            // Product Image
            Image.network(
              cartItem.image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.broken_image,
                size: 80,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: SizeApp.s16.w),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    cartItem.description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${cartItem.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "Qty: ${cartItem.quantity}",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            AddCartCubit.get(context).deleteProduct(
                                productId: productId);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
