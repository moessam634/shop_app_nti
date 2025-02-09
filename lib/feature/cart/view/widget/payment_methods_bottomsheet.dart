import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/feature/cart/view/widget/payment_methods_listview.dart';
import '../../../../core/style/size_app.dart';
import 'custom_button.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeApp.s16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: SizeApp.s8.h,
          ),
          PaymentMethodsListview(),
          SizedBox(
            height: 32.h,
          ),
          CustomButton(
            text: 'Continue',
          ),
        ],
      ),
    );
  }
}
