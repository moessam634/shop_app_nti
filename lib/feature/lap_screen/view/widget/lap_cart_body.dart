import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/core/widget/custom_snack_bar.dart';
import 'package:shopping_app/feature/favorite/cubit/favorite_cubit.dart';
import '../../../../core/style/string_app.dart';
import '../../../cart/cubit/cart_cubit.dart';
import '../../../cart/cubit/cart_state.dart';
import '../../../favorite/cubit/favorite_state.dart';
import '../../model/model/laptop_model.dart';
import 'custom_image_stack.dart';

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
          CustomImageStack(
            image: laptopModel.image,
            onPressed: () async {
              await FavoriteCubit.get(context)
                  .addFavoriteCubit(productId: productId);
              if (context.mounted) {
                final state = FavoriteCubit.get(context).state;
                if (state is FavoriteAddSuccess) {
                  customSnackBar(
                      context: context,
                      text: state.message,
                      backgroundColor: Colors.green);
                }
              }
            },
          ),
          Text(laptopModel.name),
          Text("By ${laptopModel.company}"),
          Text("\$${laptopModel.price.toStringAsFixed(2)}"),
          Text("${StringApp.description} :"),
          Text(laptopModel.description),
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
                  onPressed: () async {
                    final cubit = AddCartCubit.get(context);
                    await cubit.addCartCubit(productId: productId);
                    final state = cubit.state;
                    if (context.mounted) {
                      if (state is AddCartSuccess) {
                        customSnackBar(
                            context: context,
                            text: state.message,
                            backgroundColor: Colors.green);
                      }
                    }
                  },
                  icon: Icon(CupertinoIcons.cart_badge_plus, size: 30)),
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
