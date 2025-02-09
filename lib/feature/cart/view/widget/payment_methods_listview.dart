import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/feature/cart/view/widget/payment_method_item.dart';

class PaymentMethodsListview extends StatefulWidget {
  const PaymentMethodsListview({super.key});

  @override
  State<PaymentMethodsListview> createState() => _PaymentMethodsListviewState();
}

class _PaymentMethodsListviewState extends State<PaymentMethodsListview> {
  List paymentMethodsItems = [
    Icon(Icons.card_giftcard),
    Icon(CupertinoIcons.plus)
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodsItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: InkWell(
              onTap: () {
                activeIndex = index;
                setState(() {});
              },
              child: PaymentMethodItem(
                isActive: activeIndex == index,
                icon: paymentMethodsItems[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
