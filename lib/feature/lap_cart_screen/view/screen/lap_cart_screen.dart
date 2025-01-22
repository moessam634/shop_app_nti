import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/core/style/color_app.dart';
import 'package:shopping_app/core/style/text_style.dart';
import '../../cubit/laptop_category_cubit.dart';
import '../../cubit/laptop_category_state.dart';
import '../widget/lap_cart_body.dart';

class LapCartScreen extends StatelessWidget {
  const LapCartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.kButtonColor,
        title: Text(
          "Laptops",
          style: white(),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<LaptopCategoryCubit, LaptopCategoryState>(
        builder: (context, state) {
          if (state is LaptopCategorySuccess) {
            return ListView.builder(
              itemCount: state.lapModelList.length,
              itemBuilder: (context, index) => LapCartBody(
                laptopModel: state.lapModelList[index],
                productId: state.lapModelList[index].id,
              ),
            );
          }
          return SpinKitFadingCircle(
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
