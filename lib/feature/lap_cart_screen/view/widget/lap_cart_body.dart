import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/helper/navigation_helper.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/feature/cart/view/screen/cart_screen.dart';
import 'package:shopping_app/feature/favorite/cubit/favorite_cubit.dart';
import '../../../../core/style/string_app.dart';
import '../../../cart/cubit/add_cart_cubit.dart';
import '../../model/model/laptop_model.dart';

class LapCartBody extends StatelessWidget {
  const LapCartBody({
    super.key,
    required this.laptopModel,
    required this.productId,
  });

  final LaptopModel laptopModel;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: SizeApp.s16.h, horizontal: SizeApp.s16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: SizeApp.s16.h,
        children: [
          Center(
            child: Image.network(
              laptopModel.image,
              height: SizeApp.s200.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.grey,
                );
              },
            ),
          ),
          Text(
            laptopModel.name,
          ),
          Text(
            "By ${laptopModel.company}",
          ),
          // Price
          Text(
            "\$${laptopModel.price.toStringAsFixed(2)}",
          ),
          // Description
          Text(
            "${StringApp.description} :",
          ),
          Text(
            laptopModel.description,
          ),
          Row(
            spacing: SizeApp.s8.w,
            children: [
              Chip(
                label: Text(laptopModel.category),
                backgroundColor: Colors.blue.shade100,
              ),
              Chip(
                label: Text(laptopModel.status),
                backgroundColor: laptopModel.status == "Available"
                    ? Colors.green.shade100
                    : Colors.red.shade100,
              ),
              IconButton(
                  onPressed: () {
                    AddCartCubit.get(context)
                        .addCartCubit(productId: productId);
                    NavigationHelper.push(
                        context: context, destination: CartScreen());
                  },
                  icon: Icon(CupertinoIcons.cart)),
              IconButton(
                  onPressed: () {
                    FavoriteCubit.get(context)
                        .addFavoriteCubit(productId: productId);
                  },
                  icon: Icon(CupertinoIcons.square_favorites_alt_fill)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Stock:",
              ),
              Text(
                laptopModel.countInStock > 0
                    ? "${laptopModel.countInStock} units available"
                    : "Out of stock",
                style: TextStyle(
                  color:
                      laptopModel.countInStock > 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
