import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/feature/cart/view/widget/payment_methods_bottomsheet.dart';
import '../../../../core/style/color_app.dart';
import '../../../../core/style/size_app.dart';
import '../../../../core/style/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return PaymentMethodsBottomSheet();
            });
      },
      child: Container(
        width: double.infinity,
        height: SizeApp.s60.h,
        decoration: BoxDecoration(
            color: ColorApp.kButtonColor,
            borderRadius: BorderRadius.circular(SizeApp.s16.r)),
        child: Center(
          child: Text(
            text,
            style: white18(),
          ),
        ),
      ),
    );
  }
}

