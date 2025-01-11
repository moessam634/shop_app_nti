import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/style/color_app.dart';
import '../../../../core/style/size_app.dart';
import '../../../../core/style/string_app.dart';
import '../../../../core/style/text_style.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';
import 'card_builder.dart';
import 'custom_text_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(SizeApp.s16),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: SizeApp.s16,
                  children: [
                    CustomTextWidget(
                        text: StringApp.explore, style: deepPurple30()),
                    SizedBox(
                      height: SizeApp.s370,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return CardBuilder(
                            homeModel: state.products[index],
                          );
                        },
                      ),
                    ),
                    CustomTextWidget(
                        text: StringApp.bestSeller, style: deepPurple30()),
                    SizedBox(
                      height: SizeApp.s370,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return CardBuilder(
                            homeModel: state.products[index],
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
      },
    );
  }
}
