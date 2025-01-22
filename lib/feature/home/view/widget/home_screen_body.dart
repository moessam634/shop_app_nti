import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/style/color_app.dart';
import '../../../../core/style/size_app.dart';
import '../../../../core/style/string_app.dart';
import '../../../../core/style/text_style.dart';
import '../../cubit/home_state.dart';
import 'Custom_product_card.dart';
import 'custom_text_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key, required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    if (state is HomeSuccessState) {
      final successState = state as HomeSuccessState;
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeApp.s8.w, vertical: SizeApp.s8.h),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SizeApp.s16.h,
              children: [
                CustomTextWidget(
                    text: StringApp.explore, style: deepPurple30()),
                SizedBox(
                  height: SizeApp.s375.h,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return CustomProductCard(
                        homeModel: successState.products[index],
                      );
                    },
                  ),
                ),
                CustomTextWidget(
                    text: StringApp.bestSeller, style: deepPurple30()),
                SizedBox(
                  height: SizeApp.s375.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return CustomProductCard(
                        homeModel: successState.products[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return SpinKitFadingCircle(color: ColorApp.kButtonColor);
    }
  }
}
