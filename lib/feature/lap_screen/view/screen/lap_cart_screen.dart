import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/core/helper/navigation_helper.dart';
import 'package:shopping_app/core/style/color_app.dart';
import 'package:shopping_app/core/style/string_app.dart';
import 'package:shopping_app/core/widget/custom_app_bar.dart';
import 'package:shopping_app/feature/cart/view/screen/cart_screen.dart';
import 'package:shopping_app/feature/favorite/view/screen/favorite_screen.dart';
import '../../cubit/laptop_category_cubit.dart';
import '../../cubit/laptop_category_state.dart';
import '../widget/lap_cart_body.dart';

class LapScreen extends StatelessWidget {
  const LapScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LaptopCategoryCubit()..getALlLapsCubit(),
      child: Scaffold(
        appBar: customAppBar(title: StringApp.laptops, actions: [
          IconButton(
              onPressed: () {
                NavigationHelper.push(
                    context: context, destination: FavoriteScreen());
              },
              icon: Icon(CupertinoIcons.square_favorites_alt_fill))
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorApp.kButtonColor,
          onPressed: () {
            NavigationHelper.push(context: context, destination: CartScreen());
          },
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ),
        body: BlocBuilder<LaptopCategoryCubit, LaptopCategoryState>(
          builder: (context, state) {
            if (state is LaptopCategorySuccess) {
              return ListView.builder(
                itemCount: state.lapList.length,
                itemBuilder: (context, index) => LapCartBody(
                  laptopModel: state.lapList[index],
                  productId: state.lapList[index].id,
                ),
              );
            }
            return SpinKitFadingCircle(
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
