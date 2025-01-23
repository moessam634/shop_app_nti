import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/feature/cart/cubit/add_cart_cubit.dart';
import 'package:shopping_app/feature/cart/cubit/add_cart_state.dart';
import '../widget/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCartCubit()..getAllProductsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Shopping Cart"),
          centerTitle: true,
        ),
        body:
            BlocBuilder<AddCartCubit, AddCartState>(builder: (context, state) {
          if (state is GetProductsSuccess) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return CartItemCard(
                        cartItem: state.products[index],
                        productId: state.products[index].id,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeApp.s16.w, vertical: SizeApp.s16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$${state.products.fold<num>(0, (sum, item) => sum + (item.totalPrice)).toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return SpinKitFadingCircle(
              color: Colors.grey,
            );
          }
        }),
      ),
    );
  }
}
