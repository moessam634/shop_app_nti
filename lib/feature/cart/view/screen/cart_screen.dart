import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/core/helper/navigation_helper.dart';
import 'package:shopping_app/core/style/color_app.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/core/style/string_app.dart';
import 'package:shopping_app/core/style/text_style.dart';
import 'package:shopping_app/core/widget/custom_app_bar.dart';
import 'package:shopping_app/feature/auth/view/widget/custom_material_button.dart';
import 'package:shopping_app/feature/cart/cubit/cart_cubit.dart';
import 'package:shopping_app/feature/cart/cubit/cart_state.dart';
import 'package:shopping_app/feature/cart/view/screen/payment_details.dart';
import '../widget/cart_item_card.dart';
import '../widget/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCartCubit()..getAllProductsCubit(),
      child: Scaffold(
        appBar: customAppBar(title: StringApp.cart),
        body:
            BlocBuilder<AddCartCubit, AddCartState>(builder: (context, state) {
          if (state is GetProductsSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeApp.s16.w),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
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
                          style: bold18(),
                        ),
                        Text(
                          "\$${state.products.fold<num>(0, (sum, item) => sum + (item.totalPrice)).toStringAsFixed(2)}",
                          style: greenBold18(),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(text: 'Complete Payment',),
                  SizedBox(
                    height: SizeApp.s16.h,
                  )
                ],
              ),
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
